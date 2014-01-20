# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="arne"

# Aliases
# Navigation
alias ..="cd .."
alias -g ...="cd ../.."
alias -g ....="cd ../../.."
alias -g .....="cd ../../../.."
alias -g ......="cd ../../../../.."
alias -g la="ls -la ${colorflag}" # List all files colorized in long format, including dot files
alias crontab="crontab -i" # Add -i to every crontab command to ask everytime before deleting
alias grep="grep --color=auto" # Use colors when GNU grep with color-support

# OSX aliases
if [[ $(uname -s) == 'Darwin' ]]; then
    # Cleanup terminal logfiles, via http://osxdaily.com/2010/05/06/speed-up-a-slow-terminal-by-clearing-log-files/
    alias terminal_clean="sudo rm -rf /private/var/log/asl/*.asl"

    # Flush the DNS cache, again
    alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

    # Lock the system
    alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

    # Update alias to update OS X, Homebrew, Node packages and Ruby gems
    alias update="sudo -v; sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update"

    # Copy the working dir to the clipboard
    alias cpwd='pwd|xargs echo -n|pbcopy'
fi

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@"
    cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

# Grep in history
function greph () { history 0 | grep -i $1 }

# 'work on', via https://coderwall.com/p/feoi0a
ffunction wo() {
  CODE_DIR=~/Code
  cd $(find $CODE_DIR -type d -maxdepth 3 | grep -i $* | grep -Ev Pods --max-count=1)
}

# ZSH
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git sublime)

# Embed custom per-machine config
[[ -f ~/.localrc ]] && source ~/.localrc

source $ZSH/oh-my-zsh.sh
