#!/bin/bash
virt-install \
	--name testvm \
	--memory 4096 \
	--vcpus 1 \
	--cloud-init user-data=cc-extended.yaml \
	--boot hd \
	--osinfo linux2024 \
	--disk backing_store=/path/to/server-cloudimg.img,size=16,bus=virtio \
	--disk size=16,serial=TESTDEV \
	--disk size=16,serial=SCRATCHDEV \
	--network network=default,model=virtio \
	--graphics none \
	--serial pty
