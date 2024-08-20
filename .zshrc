# Prompt
eval "$(starship init zsh)"

# Vim mode
bindkey -v

# General aliases
alias l="eza -lah"
alias dc="docker compose"
alias vim=nvim

# Git aliases
alias lg="lazygit"
alias gs="git status"
alias gl="git log --graph --format='%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset'"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gca="git add . && git commit -v"
alias gcaa="git add . && git commit -v --amend"
alias gd="git diff --stat --patch"
function gpsu() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  git push --set-upstream origin "$branch"
}
alias gwip="git for-each-ref --sort='authordate:iso8601' --format=' %(color:green)%(authordate:relative)%09%(color:white)%(refname:short)' refs/heads"

# Directory navigation
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

# enable history
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000

# Substring search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ^r
bindkey -v
bindkey '^R' history-incremental-search-backward

# Export vars
export EDITOR=nvim
export VISUAL=nvim

# Local config
if [ -f "$HOME/.localrc" ]; then
    source "$HOME/.localrc"
fi
