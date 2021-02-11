# Enable vi-mode
bindkey -v

# Exports
export EDITOR=vim

# Path
export PATH=$HOME/go/bin:$PATH

# General aliases
alias ls='exa'
alias l='exa -la --git --time-style=long-iso'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ....='cd .. && cd .. && cd ..'
function mkd() { mkdir -p $1 && cd $1 }

# Git
alias git='hub'
alias gco='git checkout'
alias gcob='gco -b'
alias gd='git diff --stat --patch'
alias gca='git add . && git commit -v'
alias gc='git commit -v'
alias gl='git log --graph --format="%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset"'
alias gs='git status'
alias gu='git pull --rebase --autostash'
alias gpum='git pull upstream master'
alias gri="git rebase -i"

# Docker
alias dc="docker-compose"

# K8s
alias ctx="kubectl config use-context"

# Keybindings
bindkey "^[[2~" yank                    # Insert
bindkey "^[[3~" delete-char             # Del
bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
bindkey " "     magic-space             # Do history expansion on space.

# Load compdef
autoload -Uz compinit
compinit

# History
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history

# Support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Use thefuck
eval $(thefuck --alias)

# Load plugins
source <(antibody init)
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle junegunn/fzf path:shell

# Load kubectl autocompletion
if command -v kubectl &> /dev/null; then
	source <(kubectl completion zsh)
fi

eval "$(starship init zsh)"

# Load local settings
if [[ -f .localrc ]]; then
	source .localrc
fi
