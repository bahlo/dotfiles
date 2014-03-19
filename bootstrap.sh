#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude ".osx" --exclude "theme.png" -av . ~

    if [ "$(uname -s)" == "Darwin" ]; then
      brew bundle
    fi
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
    doIt
else
    echo "This may overwrite existing files in your home directory. Are you sure? (y/n)"
    read -k
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
source ~/.zshrc
