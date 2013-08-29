# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arne"

# Aliases
## Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"
# Really important
alias please="sudo "

# Functions
## Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}
## Determine size of a file or total size of a directory
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

# Github
git config --global user.name "Arne Bahlo"
git config --global user.email hallo@arne.me

# Zsh options
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Embed custom per-machine config
if [ -f "$HOME/.custom" ]; then
    source $HOME/.custom
fi
