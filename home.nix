{ config, pkgs, libs, ... }:
let 
  terminalPkgs = with pkgs; [
    age
    awscli
    binaryen
    bottom
    curl
    # clang
		cmake
    delta
    exa
    fd
    ffmpeg
    # gcc
    gh
    gopls
    hexyl
    httpie
    hurl
    imagemagick
    jq
    just
    kubetail
    magic-wormhole
    pv
    pwgen
    # ripgrep
    shellcheck
    tealdeer
    tmux
    tokei
    upx
    watch
    wrangler
    vim
    youtube-dl
  ];
  rustPkgs = with pkgs; [
    rust-analyzer
    rustup
  ];
  k8sPkgs = with pkgs; [
    k9s
    kubectl
    kubetail
  ];
in
{
  imports = (import ./nix/pkgs);

  nixpkgs.overlays = [
    (import ./nix/overlays/bs4.nix)
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

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

  home.packages = terminalPkgs ++ rustPkgs ++ k8sPkgs;
}
