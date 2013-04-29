#! /bin/bash

for item in gitconfig hgrc inputrc pythonrc.py zshenv zshrc Xresources tmux.conf i3 dunstrc
do
    if [ -h ~/."$item" ]
    then
        rm ~/."$item"
    fi
    if [ -e ~/."$item" ]
    then
        mv ~/."$item"{,.old}
    fi
    ln -s {~/dotfiles/,~/.}"$item"
done
