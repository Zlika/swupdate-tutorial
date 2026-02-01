#!/bin/sh
# Permutation du "boot flag" de la partition n°2
printf "a\n2\nw\n" | fdisk /dev/mmcblk0

