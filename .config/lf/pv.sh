#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    # *) highlight --style acid -O xterm256 "$1" || cat "$1";;
    # *) highlight --style darkness -O xterm256 "$1" || cat "$1";;
    *) highlight --style marco -O xterm256 "$1" || cat "$1";;
    # *) highlight --style dante -O xterm256 "$1" || cat "$1";;
esac


