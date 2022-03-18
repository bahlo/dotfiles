# dotfiles

My personal dotfiles

## Install

1. Install [Nix](https://nixos.org/download.html) and [home-manager](https://github.com/nix-community/home-manager)
2. Clone this repository: 
   ```shell
   git clone git@github.com:bahlo/dotfiles ~/.dotfiles`
   ```
3. Add this line to `~/.config/nixpkgs/home.nix` (replace arne with your username):
   ```nix
   imports = [ /Users/arne/.dotfiles/home.nix ];
   ```

