# -*- mode: sh; -*-
# Set EDITOR, etc.

export EDITOR=my-editor

export LESS="-R"

export PYTHONSTARTUP=~/dotfiles/pythonrc.py

export NO_AT_BRIDGE=1

if [ -z $LANG ]; then
    export LANG=en_NZ.UTF-8
fi
