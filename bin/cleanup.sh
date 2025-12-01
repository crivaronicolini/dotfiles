#!/usr/bin/env sh
#sacado de https://forum.manjaro.org/t/cleaning-up-and-freeing-disk-space/6703/25?page=2
#https://wiki.manjaro.org/index.php/Pacman_Overview#Cleaning_the_Cache

echo pacman -Sc
pacman -Sc

echo paccache -rvk0
paccache -rvk0

echo find ~/.cache/ -type f -atime +100 -delete
find ~/.cache/ -type f -atime +100 -delete

echo journalctl --vacuum-size=20M
journalctl --vacuum-size=20M

echo flatpak uninstall --unused
flatpak uninstall --unused

echo pamac clean --keep 0
pamac clean --keep 0

echo pamac remove --orphans
pamac remove --orphans

echo pamac clean --build-files
pamac clean --build-files
