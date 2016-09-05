# dotfiles

This repository manages my personal configuration for: Vim, Git, Tmux and ZSH

## Usage

Everything is done by a simple `Makefile` with the following commands:

- `make brew`: Install [Homebrew](https://brew.sh) + packages
- `make link`: Link `.*` to `$HOME` (**NOTE:** This will overwrite your current
  files)
- `make tpm`: Install [TPM](https://github.com/tmux-plugins/tpm) + plugins
- `make vim-plug`: Install [vim-plug](https://github.com/junegunn/vim-plug) + plugins
