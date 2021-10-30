{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
    goPrivate = [ 
      "github.com/bahlo"
      "github.com/axiomhq"
    ];
  };
}