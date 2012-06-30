if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec xinit -- :0 -novtswitch &>/dev/null &
    logout
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux
fi
