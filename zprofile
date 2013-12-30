# -*- mode: sh; -*-

if [ $(tty) = /dev/tty1 ]; then
    startx
    logout
elif [ $(tty) = /dev/tty2 ]; then
    tmux
fi
