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

## Libvirt basics

```bash
# Enable system-level libvirt commands, like accessing the 'default' network
sudo usermod -aG libvirt USER
export LIBVIRT_DEFAULT_URI=qemu:///system
# Logout and login so that the group addition takes effect
# After that, you can access 'default' network without sudo.
virsh net-start default
virsh net-autostart default
# Let qemu read files in your HOME
chmod o+x ~
# Install and configure libvirt NSS module
# Add at least 'libvirt_guest' after 'files' on hosts line
sudo apt install libnss-libvirt
sudoedit /etc/nsswitch.conf
# Or
sudo dnf install libvirt-nss
sudo authselect enable-feature with-libvirt

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
# With optional kickstart:
# --initrd-inject=/path/to/my.ks --extra-args "ks=file:/my.ks console=ttyS0"
# sed -i '/^#PermitRootLogin prohibit-password$/a PermitRootLogin yes' /etc/ssh/sshd_config

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
[libvirt: Libvirt NSS module](https://libvirt.org/nss.html)\
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


## Cloud-init

- Cloud images are convinient even for local libvirt; it's fast to boot, can automatically set hostname and ssh public keys.
  In other words, you can use cloud images with cloud-init as reproducible snapshots with your preferred settings.

- You can ssh with distribution default user.

  Images | default user's username
  -|-
  Ubuntu images | ubuntu
  Debian images | debian
  Fedora images | fedora
  RHEL images   | cloud-user

  You can use VM name as the hostname to ssh if you set up nsswitch.
  In the example below, with Ubuntu cloud images, `ssh ubuntu@testvm` to login .

### Example 1

Minimal settings with BIOS boot (Works with Ubuntu, Fedora and RHEL images)

```yaml {file="cc.yaml"}
```

```bash {file="install-cc.sh"}
```

```bash {file="undefine-cc.sh"}
```

### Example 2

UEFI boot (Works with Debian images)

The differences are only `--boot uefi` and `--nvram` respectively.

```bash {file="install-uefi.sh"}
```

```bash {file="undefine-uefi.sh"}
```

### Example 3

Extended example

- I found that number only password in chpasswd somehow failed
  while testing with Ubuntu cloud images, though setting password is a bad practive anyway.

```yaml {file="cc-extended.yaml"}
```

```bash {file="install-cc-ext.sh"}
```

```bash {file="undefine-ext.sh"}
```

### Example 4

```bash {file="vm.sh"}
```

### Links

[Module reference - cloud-init documentation](https://docs.cloud-init.io/en/latest/reference/modules.html)
