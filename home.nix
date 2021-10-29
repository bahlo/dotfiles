{ config, pkgs, libs, ... }:
let 
  bs4Overlay = import ./nix/overlays/bs4.nix;
in 
{
  imports = [
    ./nix/pkgs/zsh.nix
    ./nix/pkgs/git.nix
    ./nix/pkgs/tmux.nix
    ./nix/pkgs/bat.nix
    ./nix/pkgs/fzf.nix
    ./nix/pkgs/direnv.nix
  ];

  nixpkgs.overlays = [
    bs4Overlay
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
    pkgs.bottom
    pkgs.hexyl
    pkgs.tmux
    pkgs.exa
    pkgs.delta
    pkgs.fd
    pkgs.jq
    pkgs.upx
    pkgs.binaryen
    pkgs.wrangler
    pkgs.just
    pkgs.rustup
    pkgs.gh
    pkgs.youtube-dl
    pkgs.watch
    pkgs.shellcheck
    pkgs.rust-analyzer
    pkgs.ripgrep
    pkgs.pwgen
    pkgs.pv
    pkgs.magic-wormhole
    pkgs.kubetail
    pkgs.ffmpeg
    pkgs.imagemagick
    pkgs.curl
    # pkgs.hurl
    pkgs.httpie
    pkgs.age
  ];
}
