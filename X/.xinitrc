#! /bin/bash

# Set keyboard layout
setxkbmap no

# Set screen resolution
xrandr --output VGA-1 --mode 1920x1080

exec i3
