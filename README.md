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

# Link the ZSH config
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Create a .config directory
mkdir -p "$HOME/.config"

# Link Neovim config
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

# Link Starship config
ln -s "$HOME/.dotfiles/starship.toml" "$HOME/.config/starship.toml"
```
