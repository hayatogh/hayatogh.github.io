#!/bin/sh
set -euo pipefail

mddev=/dev/md0
devs=5
level=4
disk_MB=$((1 * 1024))
md_chunk_KB=256
lo_sector_sz=4096

mdadm_opt=${md_chunk_KB:+--chunk=$md_chunk_KB}
losetup_opt=${lo_sector_sz:+--sector-size=$lo_sector_sz}

img_dir=/tmp/md

if [ -b $mddev ]; then
	lodevs=$(sudo mdadm -DY $mddev | grep '^MD_DEVICE_.*_DEV=' | cut -d= -f2)
	sudo mdadm --stop --verbose $mddev
	for lodev in $lodevs; do
		img=$(losetup -nO BACK-FILE $lodev)
		sudo losetup -d $lodev
		rm $img
	done
	rmdir -p $img_dir 2>/dev/null || true
fi
if [ "${1:-}" = -d ]; then
	exit
fi

lodevs=
mkdir -p $img_dir
for _ in $(seq $devs); do
	img=$(mktemp -p $img_dir scdev.XXXX)
	truncate -s ${disk_MB}M $img
	lodev=$(sudo losetup $losetup_opt --show -f $img)
	lodevs="$lodevs $lodev"
done

sudo mdadm --create --verbose $mddev --level=$level $mdadm_opt --raid-devices=$devs $lodevs --force --run
