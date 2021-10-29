{ config, pkgs, libs, ... }:

{
  imports = (import ./nix/pkgs);

  nixpkgs.overlays = [
    (import ./nix/overlays/bs4.nix)
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

  home.packages = with pkgs; [
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
    rustup
    gh
    youtube-dl
    watch
    shellcheck
    rust-analyzer
    ripgrep
    pwgen
    pv
    magic-wormhole
    kubetail
    ffmpeg
    imagemagick
    curl
    # hurl
    httpie
    age
    tldr
  ];
}
