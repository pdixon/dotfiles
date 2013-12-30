#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$x" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout dvorak -option ctrl:nocaps

xbindkeys

udiskie &
nm-applet &

exec i3

# fallback
xterm
