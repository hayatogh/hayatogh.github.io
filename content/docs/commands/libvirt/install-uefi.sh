#!/bin/bash
virt-install \
	--name testvm \
	--memory 4096 \
	--vcpus 1 \
	--cloud-init user-data=cc.yaml \
	--boot uefi \
	--osinfo linux2024 \
	--disk backing_store=/path/to/server-cloudimg.img,size=16,bus=virtio \
	--network network=default,model=virtio \
	--graphics none \
	--serial pty
