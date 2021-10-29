{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    initExtraBeforeCompInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    initExtra = ''
      # Enable 256 colors
      [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color
      # Load p10k
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 
      # Vi mode
      bindkey -v
      # Exports
      export EDITOR=vim
      # Keybindings
      bindkey "^[[2~" yank                    # Insert
      bindkey "^[[3~" delete-char             # Del
      bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
      bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
      bindkey " "     magic-space             # Do history expansion on space.
      # Load functions
      fpath+=~/.dotfiles/zshfunctions
      autoload git-commit-co-author gpsu
      # Load local settings
      if [[ -f .localrc ]]; then
        source .localrc
      fi
    '';

    shellAliases = {
      ls = "exa";
      l = "exa -la --git --time-style=long-iso";
      ".." = "cd ..";
      "..." = "cd .. && cd ..";
      "...." = "cd .. && cd .. && cd ..";

      git = "hub";
      gco = "git checkout";
      gcob = "gco -b";
      gd = "git diff --stat --patch";
      gca = "git add . && git commit -v";
      gcap = "git add . && git-commit-co-author -v";
      gc = "git commit -v";
      gcp = "git-commit-co-author -v";
      gl = "git l";
      gs = "git status";
      gu = "git pull --rebase --autostash";
      gpum = "git pull upstream master";
      gri = "git rebase -i";

      kco = "kubectl config use-context";
      dc = "docker compose";
      ctx = "kubectl config use-context";
      nsh = "nix-shell";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "v1.15.0";
          sha256 = "1b3j2riainx3zz4irww72z0pb8l8ymnh1903zpsy5wmjgb0wkcwq";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.4.0";
          sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
        };
      }
    ];
  };
}