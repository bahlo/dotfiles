# dotfiles

This repository manages my personal configuration for: iTerm, Vim, Git, Tmux and ZSH

## Screenshot
![Dotfiles](https://cloud.githubusercontent.com/assets/1725839/18277173/cc9438b2-744d-11e6-95b6-72d8deda4b66.png)

## Install

```bash
# Clone this repository
git clone git@github.com:bahlo/dotfiles.git ~/.dotfiles

# Set everything up (overwrites existing)
cd ~/.dotfiles && make all
```

## Advanced

If you don't want everything, you can run the steps individually:

- `make brew`: Install [Homebrew](https://brew.sh) + packages
- `make link`: Link `.*` to `$HOME` (**NOTE:** This will overwrite your current
  files)
- `make tpm`: Install [TPM](https://github.com/tmux-plugins/tpm) + plugins
- `make vim-plug`: Install [vim-plug](https://github.com/junegunn/vim-plug) + plugins
