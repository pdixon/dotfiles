#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$x" ] && . "$f"
    done
    unset f
fi

eval $(gpg-agent --enable-ssh-support --daemon)
systemctl --user set-environment "DISPLAY=$DISPLAY"

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
#setxkbmap -layout dvorak -option ctrl:nocaps

xbindkeys
pulseaudio --start

xcompmgr &
nm-applet &
pasystray &

exec i3

# fallback
xterm
