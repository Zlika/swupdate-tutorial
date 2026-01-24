#!/bin/sh
mount /dev/mmcblk0p1 /mnt
if cat /proc/cmdline | grep -q "mmcblk0p2"; then
  sed -i 's/mmcblk0p2/mmcblk0p3/' /mnt/cmdline.txt
else
  sed -i 's/mmcblk0p3/mmcblk0p2/' /mnt/cmdline.txt
fi
umount /mnt

