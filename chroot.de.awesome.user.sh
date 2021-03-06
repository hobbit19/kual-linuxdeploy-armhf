#!/bin/sh

. "$(dirname "$0")"/lib.sh

[ -f "$ROOTFS_LOCK" ] || mount_rootfs_all

SIZE=$(xwininfo -root -display :0 | grep "geometry" | cut -d " "  -f4)

sleep 3 # wait kterm
do_chroot /bin/sh -c "su -l kindle sh -c 'DISPLAY=:0 Xephyr :1 -title L:D_N:application_ID:xephyr -ac -br -screen $SIZE -cc 4 -reset -terminate & sleep 3 && DISPLAY=:1 awesome'"
sleep 3 # wait awesome

quit
