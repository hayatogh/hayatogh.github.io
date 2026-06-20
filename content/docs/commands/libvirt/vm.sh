#!/bin/bash
set -euEo pipefail
shopt -s inherit_errexit failglob

img=$1
name=${2:-testvm}
cc=/tmp/$USER-cc.yaml

destroy_undef()
{
	virsh destroy $name || true
	virsh undefine --remove-all-storage --nvram $name || true
	ssh-keygen -R $name || true
}

boot=hd
case $(basename -- $img) in
Fedora*)
	user=fedora
	;;
rhel*)
	user=cloud-user
	;;
debian*)
	user=debian
	boot=uefi
	;;
*-server-cloudimg-*)
	user=ubuntu
	;;
-d)
	destroy_undef
	exit
	;;
esac

cat >$cc <<EOF
#cloud-config
hostname: $name
prefer_fqdn_over_hostname: false

ssh_authorized_keys:
  - $(cat ~/.ssh/id_ed25519.pub)
ssh_genkeytypes: [ed25519]

timezone: Asia/Tokyo
EOF

virt-install \
	--name $name \
	--memory 4096 \
	--vcpus 1 \
	--cloud-init user-data=$cc \
	--boot $boot \
	--osinfo linux2024 \
	--disk backing_store=$img,size=16,bus=virtio \
	--network network=default,model=virtio \
	--graphics none \
	--serial pty \
	--noautoconsole

trap destroy_undef EXIT

# Wait till login prompt
#   Disable local echo for cursor position report answer
#   Discard them after
saved_stty=$(stty -g)
expect <<EOF
set timeout -1
stty -echo
spawn virsh console $name
expect "login:"
send "\x1d"
expect eof
EOF
stty "$saved_stty"
perl -MPOSIX -e 'tcflush(0, TCIFLUSH)'

ssh -o StrictHostKeyChecking=no $user@$name
