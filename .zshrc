# Plugins
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "supercrabtree/k"
zplug "sindresorhus/pure"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "horosgrisa/autoenv"
zplug "zsh-users/zsh-completions"

zplug "mafredri/zsh-async" # Needed by sindresorhus/pure
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/git", from:oh-my-zsh

# Configure plugins
PURE_PROMPT_SYMBOL=λ
_Z_CMD=j

# Load plugins
if ! zplug check; then
  zplug install
fi
zplug load

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

# Aliases
alias -g ..='cd ..'
alias l='k -h'
alias la='k -ha'
alias vi='vim'
alias grep="grep --color=auto"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Git
alias gs='git status -sb'
alias gco='git checkout'
alias gd='git diff --stat --patch'
alias gc='git commit -v'
alias gca='git add --all . && git commit -v'
alias gcaa='git add --all . && git commit -v --amend'
alias gcl='git clone'
alias gri='git rebase -i'
alias gl="git log --graph --color --decorate --pretty=format:'%C(green)%h %C(yellow)[%ad]%Cred%d %Creset%s%Cblue [%cn]' --date=relative --abbrev-commit | less --RAW-CONTROL-CHARS"

# Legit
alias glb='legit branches'
alias glg='legit graft'
alias glh='legit harvest'
alias glp='legit publish'
alias glu='legit unpublish'
alias glsp='legit sprout'
alias gls='legit sync'
alias glsw='legit switch'
alias glr='legit resync'

# Functions
function mkd() {
  mkdir -p $1 && cd $1
}

# macOS specific config
if [[ $(uname -s) == 'Darwin' ]]; then
    # Cleanup terminal logfiles, via http://osxdaily.com/2010/05/06/speed-up-a-slow-terminal-by-clearing-log-files/
    alias terminal_clean="sudo rm -rf /private/var/log/asl/*.asl"

    # Flush the DNS cache, again
    alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

    # Lock the system
    alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

    # Update from AppStore, Homebrew, NPM and Gem, via https://gist.github.com/Korni22/6046739
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'
fi

# Load external scripts
. `brew --prefix`/etc/profile.d/z.sh

# Load local configuration
[[ -f ~/.localrc ]] && source ~/.localrc

