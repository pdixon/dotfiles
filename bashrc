if [ -f ~/dotfiles/sh/env ]; then
   . ~/dotfiles/sh/env
fi

if [ -f ~/dotfiles/sh/config.bash ]; then
   . ~/dotfiles/sh/config.bash
fi

if [ -f ~/dotfiles/sh/aliases ]; then
   . ~/dotfiles/sh/aliases
fi

if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi
