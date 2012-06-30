#!/bin/sh

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout dvorak -option ctrl:nocaps

exec ~/dotfiles/bin/dwm-start
