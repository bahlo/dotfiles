# dotfiles

My personal dotfiles

## Install

### Nix

1. Install [Nix](https://nixos.org/download.html) and [home-manager](https://github.com/nix-community/home-manager)
2. Clone this repository: 
   ```shell
   git clone git@github.com:bahlo/dotfiles ~/.dotfiles`
   ```
3. Add this line to `~/.config/nixpkgs/home.nix` (replace arne with your username):
   ```nix
   imports = [ /Users/arne/.dotfiles/home.nix ];
   ```
4. Run `home-manager switch`

### Homebrew

1. Install [Homebrew](https://brew.sh)
2. Run `brew bundle` in `~/.dotfiles` to install all applications in the <Brewfile>
   
### Manual setup
Here's a list of things that can't be automated easily:
- [ ] Set DuckDuckGo as default search engine in Safari, Firefox
- [ ] Map the capslock key to escape
- [ ] Set up FastMail
- [ ] Install PragmataPro
- [ ] Import GPG keys
- [ ] Set up K8s contexts
