#!/bin/sh

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout dvorak -option ctrl:nocaps
synclient VertScrollDelta=-100 HorizScrollDelta=-100 HorizTwoFingerScroll=1

xbindkeys

udiskie &
nm-applet &

exec i3
