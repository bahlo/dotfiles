{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Arne Bahlo";
    userEmail = "hey@arne.me";
    signing = {
      key = "C6C4BA42";
      signByDefault = true;
    };
    aliases = {
      wip = "for-each-ref --sort='authordate:iso8601' --format=' %(color:green)%(authordate:relative)%09%(color:white)%(refname:short)' refs/heads";
      l = "log --graph --format='%C(yellow)%h%Creset - %s %Cgreen(%cr) %C(blue)%an %Creset'";
    };
    ignores = [
      ".DS_STORE"
      "*.swp"
      ".idea"
      ".vscode"
      "__debug_bin"
      ".envrc"
    ];
    lfs = {
      enable = true;
    };
    delta = {
      enable = true;
      options = {
        syntax-theme = "base16";
        navigate = true;
        side-by-side = true;
        line-numbers = false;
      };
    };
    extraConfig = {
      apply.whitespace = "fix";
      core.sshCommand = "/usr/bin/ssh";  # OpenSSH in nix doesn't support UseKeychain
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
      };
      push.default = "simple";
      pull.rebase = "true";
      init.defaultBranch = "main";
    };
    includes = [
      {
        path = "~/.gitconfig-axiom";
        condition = "gitdir:~/Developer/Axiom/";
      }
    ];
  };
}
