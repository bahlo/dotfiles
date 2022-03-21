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
    nixUnstable
    pv
    pwgen
    ripgrep
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

  xdg.configFile."nix/nix.conf".text = ''
  experimental-features = nix-command flakes
'';

  home.packages = terminalPkgs ++ rustPkgs ++ k8sPkgs;
}
