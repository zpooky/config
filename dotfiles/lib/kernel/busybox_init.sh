#!/bin/sh

mount -t proc none /proc
mount -t sysfs none /sys

#Create device nodes
mknod /dev/null c 1 3
mknod /dev/tty c 5 0
mdev -s

echo -e "\nBoot took $(cut -d' ' -f1 /proc/uptime) seconds\n"

alias ll="ls -alh"
alias vim="vi"

exec /bin/sh
