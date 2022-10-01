#!/usr/bin/env sh
#sacado de https://forum.manjaro.org/t/cleaning-up-and-freeing-disk-space/6703/25?page=2
pacman -Sc
find ~/.cache/ -type f -atime +100 -delete
journalctl --vacuum-size=100M
flatpak uninstall --unused
pamac remove --orphans
pamac clean --build-files

#Removes old revisions of snaps
#CLOSE ALL SNAPS BEFORE RUNNING THIS
#sacado de https://www.debugpoint.com/2021/03/clean-up-snap/
set -eu
LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
    snap remove "$snapname" --revision="$revision"
done
