{ config, pkgs, libs, ... }:
let 
  terminalPkgs = with pkgs; [
    bottom
    hexyl
    tmux
    exa
    delta
    fd
    jq
    upx
    binaryen
    wrangler
    just
    gh
    youtube-dl
    watch
    shellcheck
    ripgrep
    pwgen
    pv
    magic-wormhole
    ffmpeg
    imagemagick
    curl
    # hurl
    httpie
    age
    tldr
    awscli
  ];
  rustPkgs = with pkgs; [
    rustup
    rust-analyzer
  ];
  k8sPkgs = with pkgs; [
    kubetail
    k9s
    kubectl
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
