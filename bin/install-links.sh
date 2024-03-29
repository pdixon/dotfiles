#! /bin/bash

for item in gitconfig hgrc inputrc zshenv zshrc tmux.conf mrconfig
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

for item in ~/dotfiles/config/*;
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
