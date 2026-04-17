#!/bin/sh
set -euxo pipefail

ZRAM_DEV=zram0
# COMP_ALGO=lzo-rle
DISKSIZE=32G
MEMLIMIT=16G
MOUNT_POINT=/mnt/ramdisk

if [ "${1:-}" = -d ]; then
	# Remove
	sudo umount $MOUNT_POINT
	sudo rmdir $MOUNT_POINT
	sudo modprobe -r zram
	exit
fi

# zram setup
if ! lsmod | grep -q ^zram; then
	sudo modprobe zram num_devices=1
fi

echo 1 | sudo tee /sys/block/$ZRAM_DEV/reset

cat /sys/block/$ZRAM_DEV/comp_algorithm
# echo $COMP_ALGO | sudo tee /sys/block/$ZRAM_DEV/comp_algorithm

cat /sys/block/$ZRAM_DEV/disksize
echo $DISKSIZE | sudo tee /sys/block/$ZRAM_DEV/disksize

echo $MEMLIMIT | sudo tee /sys/block/$ZRAM_DEV/mem_limit

# Mkfs and mount
sudo mkfs.xfs -f $ZRAM_DEV
sudo mkdir -p $MOUNT_POINT
sudo mount -o discard $ZRAM_DEV $MOUNT_POINT

# Allow user access
sudo chown $USER:$USER $MOUNT_POINT

# Show settings
zramctl
