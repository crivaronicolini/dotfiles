#!/bin/bash

current=$(xdotool getactivewindow)
guakewindow=$(xdotool search --class guake)

echo "$guakewindow"
wppwindow=$(xdotool search --name WhatsApp)
if [ -z "$wppwindow" ]
then
    xdg-open https://web.whatsapp.com &
    wppwindow=$(xdotool search --name WhatsApp)
fi

# if [ "$current" != "$wppwindow" ]
# then
#     if [ "$current" == "$guakewindow" ]
#     then
#         guake --hide
#         echo hide
#     fi
#     xdotool windowactivate "$wppwindow"
# else
#     xdotool windowminimize "$wppwindow"
# fi

case "$current" in
    "$wppwindow") xdotool windowminimize "$wppwindow";;
    # "$guakewindow") guake --hide && xdotool windowactivate "$wppwindow";;
    *) xdotool windowactivate "$wppwindow";;
esac
