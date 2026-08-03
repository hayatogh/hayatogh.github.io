#!/bin/sh
set -euxo pipefail

if [ "${1:-}" = -d ]; then
	# Remove
	sudo modprobe -r brd
	exit
fi

# rd_size in KiB
sudo modprobe --first-time brd rd_nr=4 rd_size=$((1 * 1024 * 1024))
ls --color=auto -l /dev/ram*
