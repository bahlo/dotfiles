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
      cleanup = "!git branch --merged | grep -v master | grep -v main | xargs -n 1 git branch -d";
      fixlast = "commit --amend --no-edit";
    };
    ignores = [
      ".DS_STORE"
      "*.swp"
      ".idea"
      ".vscode"
      "__debug_bin"
      ".envrc"
      ".direnv"
      ".nova"
    ];
    lfs = {
      enable = true;
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
        path = "~/.config/git/config-axiom";
        condition = "gitdir:~/Developer/axiomhq/";
      }
    ];
  };
}
