# My ZSH configuration
# Part of this is based on https://github.com/fatih/dotfiles

local HOMEBREW_PREFIX=$(brew --prefix)

# Autocompletion
fpath=(\
	$HOMEBREW_PREFIX/share/zsh-completions \
	$HOMEBREW_PREFIX/share/zsh/site-functions \
	$fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U compinit && compinit

# Plugins
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(jump shell)"
eval $(thefuck --alias ohno)

# Enable vi-mode
bindkey -v

# Exports
export EDITOR=vim

# General aliases
alias l="exa -la --git --time-style=long-iso"
alias ls="l"
alias ..='cd ..'

# Git
alias gs="git status -s"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gd="git diff --stat --patch"
alias gca="git add . && git commit -v"
alias gcas="git add . && git commit -S -v"
alias gc="git commit -S -v"
alias gri="git rebase -i"
alias gl="git log --graph --format='%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset'"
alias gbm="git branch -m"
function gpsu() {
  branch=$(git symbolic-ref --short HEAD)
  echo "git push --set-upstream origin $branch"
  git push --set-upstream origin $branch
}
alias ga="git add"
alias gst="git add . && git stash"
alias gstp="git stash pop"
alias gra="git remote add origin"

# Yarn
alias ys="yarn start"
alias yd="yarn dev"
alias yu="yarn unit"
alias yuw="yarn unit-watch"
alias yi="yarn install"

# Docker
alias dc="docker-compose"

# PHP
alias co="composer"

# Terraform
alias tf="terraform"
alias tfa="terraform apply"

# Functions 
function mkd() { mkdir -p $1 && cd $1 }
function fb() {
	cd "/Users/arnebahlo/Developer/Fastbill/$1"
}

# Prompt
autoload -U colors && colors
setopt promptsubst

local ret_status="%(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$)"
PROMPT='${ret_status} %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get customzsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')

  if [[ "$(command git config --get customzsh.hide-dirty)" != "1" ]]; then
    FLAGS+='--ignore-submodules=dirty'
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Keybindings
bindkey "^[[2~" yank                    # Insert
bindkey "^[[3~" delete-char             # Del
bindkey "^[[5~" up-line-or-history      # PageUp
bindkey "^[[6~" down-line-or-history    # PageDown
bindkey "^[e"   expand-cmd-path         # C-e for expanding path of typed command.
bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
bindkey " "     magic-space             # Do history expansion on space.
bindkey "^[[1~" beginning-of-line       # Pos1
bindkey "^[[4~" end-of-line             # End
bindkey "^[[1;3C" forward-word          # Alt+Right
bindkey "^[[1;3D" backward-word         # Alt-Left

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

# Enable syntax highlighting
# NOTE: This has to be at the end
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vim="nvim"

# Import .localrc
[ -r ~/.localrc ] && source ~/.localrc
