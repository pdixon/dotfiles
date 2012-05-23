# Use nice names for colors
autoload -U colors
colors
setopt prompt_subst

# Prompt helpers
function git_current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "${ref#refs/heads/}"
}

function git_commit_id() {
    echo "$(git rev-parse --short HEAD 2>/dev/null)"
}

function git_repo_clean() {
    if [[ -n $(git status --short 2> /dev/null) ]]; then
        echo "✗"
    fi
}


# Prompt set up.
PROMPT='
%~
→ '

RPROMPT='%{$fg[white]%} $(git_current_branch) $(git_commit_id) $(git_repo_clean)%{$reset_color%}'

# Title handling

function title() {
    if [[ $TERM == xterm* ]] || [[ $TERM == rxvt* ]]; then
        print -Pn "\e]2;$2:q\a" #set the window name
        print -Pn "\e]1;$1:q\a" #set the tab
    fi
}

function precmd() {
    title "%n@%m: %~" "%15<..<%~%<<"
}

function preexec() {
    setopt extended_glob
    local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
    title "$CMD" "%100>...>$2%<<"
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

autoload compinit
compinit

compdef '_files -g "*.mdwn"' mdwn2html
compdef '_files -g "*.mdwn"' mdwn2odt
compdef '_files -g "*.mdwn"' markdown2pdf
