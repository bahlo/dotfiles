# Plugins
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug 'dracula/zsh', as:theme

if ! zplug check; then
  zplug install
fi
zplug load

# General aliases
alias vim="vim"
alias vi="vim"
alias jd="cd ~/Developer"
alias jf="cd ~/Developer/FastBill"
alias jg="cd ~/Developer/GitHub"
alias l="exa -l --git"
alias la="exa -la --git"

# Git aliases
alias g="git status -s"
alias gco="git checkout"
alias gp="git push"
alias gpu="git push --set-upstream"
alias gc="git commit -v"
alias ga="git commit -v --amend"
alias gca="git add . && git commit -v"
alias gd="git diff --stat --patch"
alias gri="git rebase -i"
alias gl="git log --pretty=oneline --abbrev-commit"

# Docker aliases
alias dc="docker-compose"
alias d="docker"
alias dcp="docker-compose pull"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"

# Functions
function mkd() { mkdir -p $1 && cd $1 }

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

# Load external scripts
. `/usr/local/bin/brew --prefix`/etc/profile.d/z.sh

# Load local configuration
[[ -f ~/.localrc ]] && source ~/.localrc

# Start tmux if not already in session
[ -z "$TMUX" ] && tmux new-session -A -s dev && exit
