#! /bin/bash

# Load resources
if [ -f $HOME/.Xresources ]; then
    xrdb -merge .Xresources
fi
if [ -f $HOME/.Xmodmap ]; then
    xmodmap $HOME/.Xmodmap
fi

# Fire up apps
ssh-agent &
trackerd &
xscreensaver -no-splash &

exec xmonad