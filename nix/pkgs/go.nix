{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    package = pkgs.go_1_17;
    goPath = "go";
    goBin = "go/bin";
    goPrivate = [ 
      "github.com/bahlo"
      "github.com/axiomhq"
    ];
  };
}
