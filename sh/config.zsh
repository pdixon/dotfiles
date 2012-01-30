# Use nice names for colors
autoload -U colors
colors
setopt prompt_subst

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

PROMPT='
%~
→ '

RPROMPT='%{$fg[white]%} $(git_current_branch) $(git_commit_id) $(git_repo_clean)%{$reset_color%}'
