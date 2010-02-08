autoload -U colors
colors
setopt prompt_subst

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on <branch>>\
< at <tags|, >>\
<status|modified|unknown><update><
patches: <patches|join( → )>>" 2>/dev/null
}

PROMPT='
%~$(hg_prompt_info)
→ %{$reset_color%}'

# Set RPROMPT to have info show up on the right, too.

#############################
# Other Options

# setopt PRINT_EXIT_VALUE

setopt CORRECT
setopt CORRECTALL

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY # write history only when closing
setopt EXTENDED_HISTORY # add more info

# Other tabbing options
# setopt NO_AUTO_MENU
# setopt BASH_AUTO_LIST

#############################
# Variables

# Quote pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

REPORTTIME=10 # Show elapsed time if command took more than X seconds
LISTMAX=0 # ask to complete if top of list would scroll off screen

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Make CTRL-W delete after other chars, not just spaces
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}

bindkey -e

