# -*- mode: sh; -*-
# Set PATH, CDPATH, EDITOR, etc.

typeset -U path

if [[ `hostname` == "pddev3" ]]; then
   path=(/usr/local/bin /opt/codesourcery-g++-arm-none-eabi/4.5.2-2011.03-42/bin $path)
fi

if [[ `uname` == "Darwin" ]]; then
    path=(/usr/texbin ~/Library/Python/2.7/bin /opt/homebrew/bin ~/Library/Haskell/bin $path)
    manpath=(/opt/homebrew/share/man $manpath)
    export LUA_PATH="/opt/homebrew/share/lua/5.1/?.lua;;"
else
    path=(~/.cabal/bin $path)
fi

path=(~/dotfiles/bin ~/bin ~/.local/bin ~/.gem/ruby/1.8/bin $path)

export EDITOR=my-editor

export LESS="-R"

export PYTHONSTARTUP=~/dotfiles/pythonrc.py

