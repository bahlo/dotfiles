# Create a new directory and enter it
function mkd() {
    mkdir -p "$1" && cd "$1"
}

# Grep in history
function greph () { history 0 | grep -i $1 }

# 'work on', via https://coderwall.com/p/feoi0a
function wo() {
  CODE_DIR=~/Developer
  cd $(find $CODE_DIR \( -type l -o -type d \) -maxdepth 3 | grep -i $* | grep -Ev Pods --max-count=1)
}

# Mux with fuzzy matching
function mu() {
  mux $(ls ~/.tmuxinator | grep -i $* | sed -E "s/(.*)\.yml/\1/")
}
