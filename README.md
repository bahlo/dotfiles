# dotfiles

My personal dotfiles.

## Installation

First, install [Homebrew](https://brew.sh).
Then run this script:

```sh
# Clone this repository
git clone git@github.com:bahlo/dotfiles "$HOME/.dotfiles"

# Install Homebrew dependencies
cd "$HOME/.dotfiles" && brew bundle

# Create a .config directory
mkdir -p "$HOME/.config"

# Link the Fish config
ln -s "$HOME/.dotfiles/.fish" "$HOME/.config/fish"

# Link Helix config
ln -s "$HOME/.dotfiles/helix" "$HOME/.config/helix"

# Link Tmux config
ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
```
