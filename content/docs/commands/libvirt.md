---
title: "Libvirt"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
---

```bash
# Enable libvirt commands
sudo usermod -aG libvirt USER
export LIBVIRT_DEFAULT_URL=qemu:///system
# Let qemu read files in your HOME
chmod o+x ~

# Basic
virsh list --all
virsh start --console DOMAIN
# Ctrl-] to escape from console
virsh console DOMAIN
virsh shutdown DOMAIN
virsh undefine --remove-all-storage DOMAIN

# Install
osinfo-query os | less
virt-install --name NEWGUEST --memory 8192 --vcpus 4 --cpu host-model \
	--location /path/to/iso --extra-args console=ttyS0 \
	--osinfo linux2024 \
	--disk size=16,bus=virtio \
	--network network=default,bus=virtio \
	--graphics none \
	--serial pty

# Editing
virsh edit DOMAIN

# Clone changing UUIDs, leaving hostname unchanged
virt-clone --auto-clone -o ORIG_DOMAIN -n NEW_DOMAIN
# Customize hostname and more
virt-sysprep --operations bash-history,customize \
	--hostname NEWHOSTNAME
	--append-line '/etc/fstab:10.0.0.1:/path/to/export /mnt/nfs nfs default 0 0'
	-d DOMAIN

# Resize disk image and extend partition in VM
qemu-img resize /path/to/image +1G
# fdisk /dev/vda
# Command (m for help): d
# Partition number (1-4): 4
# Command (m for help): n

# List XMLs
ls /etc/libvirt/qemu
# List qcow2 images
ls /var/lib/libvirt/images
```

[libvirt: Domain XML format](https://libvirt.org/formatdomain.html)\
[virsh(1)](https://www.libvirt.org/manpages/virsh.html)

[virt-edit(1)](https://libguestfs.org/virt-edit.1.html)
[virt-sysprep(1)](https://libguestfs.org/virt-sysprep.1.html)
[virt-ls(1)](https://libguestfs.org/virt-ls.1.html)
[virt-cat(1)](https://libguestfs.org/virt-cat.1.html)
and more on [libguestfs.org](https://libguestfs.org/)

[virt-install(1)](https://github.com/virt-manager/virt-manager/blob/main/man/virt-install.rst)
[virt-clone(1)](https://github.com/virt-manager/virt-manager/blob/main/man/virt-clone.rst)
[virt-xml(1)](https://github.com/virt-manager/virt-manager/blob/main/man/virt-xml.rst)
[virt-manager(1)](https://github.com/virt-manager/virt-manager/blob/main/man/virt-manager.rst)

[qemu-img(1)](https://www.qemu.org/docs/master/tools/qemu-img.html)

[libvirt - Debian Wiki](https://wiki.debian.org/libvirt)
lists available tools and packages.
