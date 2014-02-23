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

for item in ~/dotfiles/xdg_config/*
do
    base_item=$(basename "$item")
    target_item=~/.config/"$base_item"
    if [ -h "$target_item" ]
    then
        rm "$target_item"
    fi
    if [ -e "$target_item" ]
    then
        mv "$target_item"{,.old}
    fi
    ln -s $item $target_item
done
