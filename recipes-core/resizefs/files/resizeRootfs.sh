#!/bin/sh

ROOT_DEV=$(findmnt / -o SOURCE -n)
PART=$(echo $ROOT_DEV | grep -o '[0-9]*$')

# Only if the partition can be safely resized (not read-only, not in use elsewhere)
if [ "$PART" != "" ]; then
    echo "Expanding partition..."
    # Grow the partition
    parted /dev/mmcblk1 resizepart $PART 100%
    # Resize the filesystem to fill the partition
    resize2fs $ROOT_DEV
    systemctl disable resizefs.service
    sleep 10
    reboot -f -n
fi
