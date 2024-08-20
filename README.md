# dotfiles

My personal dotfiles.

![A screenshot showing a macOS terminal app with Tmux, Neovim and Neofetch](https://github.com/user-attachments/assets/e42d99e2-1cc5-4038-8ce0-cb4bd519e74a)

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

# Install tpm (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link Tmux config
ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
```
