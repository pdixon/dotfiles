export PATH=~/bin:$PATH

alias ls='ls -AG'
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

# Set up the prompt.
PS1="[\u@\h \W]\\$ "
PS2='> '
export PS1 PS2

# Increase history size
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTFILESIZE=100000000
HIST=1000000

export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=' -R '