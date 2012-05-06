if [ -f ~/dotfiles/sh/env ]; then
   . ~/dotfiles/sh/env
fi

if [ -f ~/dotfiles/sh/config.zsh ]; then
   . ~/dotfiles/sh/config.zsh
fi

if [ -f ~/dotfiles/sh/aliases ]; then
   . ~/dotfiles/sh/aliases
fi

if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi

