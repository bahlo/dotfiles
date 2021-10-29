{ config, pkgs, libs, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "arne";
  home.homeDirectory = "/Users/arne";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.packages = [
    pkgs.htop
    pkgs.neovim
    pkgs.bat
    pkgs.hexyl
    pkgs.fzf
    pkgs.tmux
    pkgs.exa
    pkgs.delta
    pkgs.fd
    pkgs.vim
    pkgs.jq
    pkgs.httpie
    pkgs.upx
    pkgs.binaryen
    pkgs.wrangler
    pkgs.just
  ];

  # direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
