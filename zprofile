if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx -- vt01 &
    logout
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux
fi
