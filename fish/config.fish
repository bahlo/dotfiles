if status is-interactive
    # Commands to run in interactive sessions can go here
end

# No greeting pls
set fish_greeting

set -x EDITOR hx

# Muscle memory
abbr --add gd "git diff"
abbr --add gl "git log --graph --format='%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset'"
abbr --add gco "git checkout"
abbr --add gcob "git checkout -b"
abbr --add gca "git add . && git commit -v"
abbr --add gri "git rebase -i"

# Actually useful
abbr --add l "eza -lah"
abbr --add dc "docker compose"
abbr --add lg lazygit
function gpsu
    git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
end

# Path stuff
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path /opt/homebrew/bin

# Configure hydro
set --global hydro_color_pwd cyan

# Make GPG work (don't ask)
set GPG_TTY $(tty)

# English please
export LANG="en_GB.UTF-8"
