export PATH=$PATH:/opt/local/bin:/opt/avr/bin:~/bin:~/scripts:/usr/local/bin:~/devtools/armThumb/bin:/opt/spice/bin

alias ls='ls -AG'

export EDITOR="emacsclient"

hg_ps1() {
    hg prompt "{root|basename}@{rev}{status}{update}" 2> /dev/null
}

# Set up the prompt.
PS1='[\u@\h \W]\\$ '
PS2='> '
export PS1 PS2

# Increase history size
shopt -s histappend
PROMPT_COMMAND='history -a'
HISTFILESIZE=100000000
HIST=1000000

