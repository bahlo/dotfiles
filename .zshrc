# Enable 256 colors
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# Enable vi-mode
bindkey -v

# Exports
export EDITOR=vim

# Navigational aliases
alias ls='exa'
alias l='exa -la --git --time-style=long-iso'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ....='cd .. && cd .. && cd ..'

# Git aliases
alias git='hub'
alias gco='git checkout'
alias gcob='gco -b'
alias gd='git diff --stat --patch'
alias gca='git add . && git commit -v'
alias gc='git commit -v'
alias gl='git l'
alias gs='git status'
alias gu='git pull --rebase --autostash'
alias gpum='git pull upstream master'
alias gri="git rebase -i"

alias kco='kubectl config use-context'

# Docker
alias dc="docker compose"

# K8s
alias ctx="kubectl config use-context"

# Functions
function gpsu() {
	local branch=$(git rev-parse --abbrev-ref HEAD)
	git push --set-upstream origin "$branch"
}

# Keybindings
bindkey "^[[2~" yank                    # Insert
bindkey "^[[3~" delete-char             # Del
bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
bindkey " "     magic-space             # Do history expansion on space.

# Load compdef
autoload -Uz compinit
compinit

# Use thefuck
eval $(thefuck --alias)

# Load starship
eval "$(starship init zsh)"

# Load and configure mcfly
eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim

# Load kubectl autocompletion
if command -v kubectl &> /dev/null; then
	source <(kubectl completion zsh)
fi

# Load plugins
source <(antibody init)
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-autosuggestions

# Load local settings
if [[ -f .localrc ]]; then
	source .localrc
fi
