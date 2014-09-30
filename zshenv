# -*- mode: sh; -*-
# Set PATH, CDPATH, EDITOR, etc.

setopt NO_GLOBAL_RCS

typeset -U path

path=(/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin)

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

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

path=(~/dotfiles/bin ~/bin ~/.local/bin ~/.gem/ruby/2.0.0/bin $path)

export EDITOR=my-editor

export LESS="-R"

export PYTHONSTARTUP=~/dotfiles/pythonrc.py

export NO_AT_BRIDGE=1

if [ -z $LANG ]; then
    export LANG=en_NZ.UTF-8
fi
