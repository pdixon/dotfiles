#!/bin/sh

# xrdb -merge ~/.Xresources
# xmodmap ~/.Xmodmap
# setxkbmap -layout dvorak -option ctrl:nocaps

# xbindkeys

# udiskie &
# nm-applet &

# exec i3
exec systemd --user
