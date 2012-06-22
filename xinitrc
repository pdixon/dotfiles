#!/bin/sh

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout dvorak -option ctrl:nocaps

exec ~/builds/dwm/dwm