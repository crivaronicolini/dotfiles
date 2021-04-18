#!/bin/sh

guake --preferences
sleep 0.8
xdotool windowclose $(xdotool search --name "Guake Preferences")
