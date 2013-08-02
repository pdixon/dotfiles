# -*- mode: sh; -*-

if [ -f ~/.zshenv ]; then
    . ~/.zshenv
fi

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    start-session
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux
fi
