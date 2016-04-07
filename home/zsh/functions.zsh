# Create a new directory and enter it
function mkd() {
    mkdir -p "$1" && cd "$1"
}

# Grep in history
function greph () { history 0 | grep -i $1 }

# 'work on', via https://coderwall.com/p/feoi0a
function wo() {
  CODE_DIR=~/Developer
  cdl $(find $CODE_DIR \( -type l -o -type d \) -maxdepth 3 | grep -i $* | grep -Ev Pods --max-count=1)
}

# Mux with fuzzy matching
function mu() {
  mux $(ls ~/.tmuxinator | grep -i $* | sed -E "s/(.*)\.yml/\1/")
}

# Colorful man pages
# http://apple.stackexchange.com/a/96810
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# CD into destination directory of symlink or directory if not a symlink
function cdl() {
  DEST_DIR=$(readlink $1)

  # Check if destination is symlink and cd into directory
  if [[ -n $DEST_DIR ]]; then
    cd $DEST_DIR
    return
  fi

  # Otherwise just cd to destination
  cd $1
}
