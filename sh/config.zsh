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
    if [[ $TERM == screen* ]]; then
        print -Pn "\ek$1:q\e\\"
    elif [[ $TERM == xterm* ]] || [[ $TERM == rxvt* ]]; then
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
