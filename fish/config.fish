if status is-interactive
    # Commands to run in interactive sessions can go here
end

# No greeting pls
set fish_greeting

# Old habits die hard
set EDITOR hx
alias vim="$EDITOR"
alias nvim="$EDITOR"

# Muscle memory
alias gl="git log --graph --format='%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset'"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gca="git add . && git commit -v"
alias gri="git rebase -i"

# Actually useful
alias l "eza -lah"
alias dc="docker compose"
alias lg="lazygit"
function gpsu
    set -l branch $(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin "$branch"
end

# Path stuff
fish_add_path $HOME/.cargo/vin
fish_add_path /opt/homebrew/bin

# Configure hydro
set --global hydro_color_pwd cyan

# Make GPG work (don't ask)
set GPG_TTY $(tty)
