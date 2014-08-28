# Dotfiles

These are my dotfiles, have fun!

## Install
First, you'll need ZSH. On a Mac, install [Homebre](http://brew.sh) first:
```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

Then run the bootstrap script and you're set:
```bash
bash scripts/bootstrap
```

_Note:_ You may want to use [iTerm](http://iterm2.com) with `xterm-256color`
and a 256-color scheme, I prefer
[Base16](http://chriskempson.github.io/base16).

## Bonbon
You can add a file in `~/.localrc` where you can put all your `$PATH`
extensions and general local configuration (like
[base16-shell](https://github.com/chriskempson/base16-shell#zsh)).

