# -*- mode: sh; -*-
setopt prompt_subst

autoload -U vcs_info

zstyle ':vcs_info:*' max-exports 2
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' use-simple false
zstyle ':vcs_info:*' enable hg git
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' stagedstr "*"
zstyle ':vcs_info:hg:*' branchformat "%b"
zstyle ':vcs_info:*' actionformats "%b %.8i %a %c%u" "zsh: %r"
zstyle ':vcs_info:*' formats       "%b %.8i %c%u"    "zsh: %r"

# Prompt set up.
PROMPT='
%~
> '

RPROMPT='${vcs_info_msg_0_}'

# Title handling
# Based on grml zshrc

function ESC_print() {
    info_print $'\ek' $'\e\\' "$@"
}

function set_title () {
    info_print $'\e]0;' $'\a' "$@"
}

function info_print () {
    local esc_begin esc_end
    esc_begin="$1"
    esc_end="$2"
    shift 2
    printf '%s' ${esc_begin}
    printf '%s' "$*"
    printf '%s' "${esc_end}"
}

function precmd() {
    vcs_info

    case $TERM in
        (screen*)
            if [[ -n ${vcs_info_msg_1_} ]] ; then
                ESC_print ${vcs_info_msg_1_}
            else
                ESC_print "zsh"
            fi
            ;;
        (xterm*|rxvt*)
            set_title ${(%):-"%n@%m"}
            ;;
        (eterm*)
            echo -e "\033AnSiTu" "$LOGNAME"
            echo -e "\033AnSiTc" "$(pwd)"
            echo -e "\033AnSiTh" "$(hostname)"
            ;;
    esac
}

function preexec() {
    emulate -L zsh
    setopt extended_glob

    case $TERM in
        (screen*)
            local CMD="${1[(wr)^(*=*|sudo|ssh|-*)]}"
            ESC_print ${CMD}
            ;;
        (xterm*|rxvt*)
            set_title ${(%):-"%n@%m"} "$1"
            ;;
    esac
}

# Line Editor Setup.

setopt CORRECT
setopt CORRECTALL

bindkey -e

# Make CTRL-W delete after other chars, not just spaces
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Quote pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

# History handling

HISTFILE=~/.zsh_history
SAVEHIST=100000
HISTSIZE=1000000

setopt share_history
setopt append_history
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_dups

# Completion
LISTMAX=0 # ask to complete if top of list would scroll off screen

zmodload zsh/complist
autoload -Uz compinit && compinit

zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs ..
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' rehash true
zstyle ':completion:*' group-name ''

zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

compdef '_files -g "*.mdwn"' mdwn2html
compdef '_files -g "*.mdwn"' mdwn2odt
compdef '_files -g "*.mdwn"' markdown2pdf

autoload zmv

if [ -f ~/dotfiles/zshaliases ]; then
   . ~/dotfiles/zshaliases
fi

if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi

