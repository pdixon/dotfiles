#! /bin/bash

# Load resources
if [ -f $HOME/dotfiles/Xresources ]; then
    xrdb -merge $HOME/dotfiles/Xresources
fi
#if [ -f $HOME/.Xmodmap ]; then
#    xmodmap $HOME/.Xmodmap
#fi

# Fire up apps
ssh-agent &
#wicd-client &
nm-applet &
bluetooth-applet &
halevt &
xscreensaver -no-splash &

exec awesome