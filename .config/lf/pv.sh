#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext -l 5 "$1" -;;
    *.mkv|*.avi|*.png|*.jpg|*.jpeg)
        mediainfo "$1"
        exiftool "$1";;
    *) highlight --style marco -O xterm256 "$1" || cat "$1";;
esac


