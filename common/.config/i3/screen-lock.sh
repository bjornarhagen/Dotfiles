#!/usr/bin/env bash

icon="$HOME/.config/i3/screen-lock-icon.png"
tmpbg="/tmp/screen.png"
cp ~/Pictures/wallpaper.jpg $tmpbg

(($#)) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
