{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    initExtra = ''
      eval "$(starship init zsh)"

      # Enable 256 colors
      [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

      # Keybindings
      bindkey "^[[2~" yank                    # Insert
      bindkey "^[[3~" delete-char             # Del
      bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
      bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
      bindkey " "     magic-space             # Do history expansion on space.

      # gpsu = git push --set-upstream origin <current-branch>
      function gpsu() {
        local branch=$(git rev-parse --abbrev-ref HEAD)
        git push --set-upstream origin "$branch"
      }

      # No go.nix, but we need those folders and envs
      export GOPATH=$HOME/go
      export GOBIN=$GOPATH/bin
      export PATH=$PATH:$GOBIN
      export GOPRIVATE=github.com/bahlo,github.com/axiomhq
      mkdir -p $GOPATH/src $GOPATH/pkg $GOPATH/bin

      # Thanks https://github.com/hpcsc/dotfiles/blob/63f194aa553ef83f9edec76991f2265f7962b00e/link/common/zsh/.functions/fzf-functions/fcm
      function git-commit-co-author() {
        SELECTED_AUTHORS=$(git shortlog -sne | awk '{$1=""}1' | fzf -m)

        MESSAGE="\n\n"
        # convert newline-delimited string to array, zsh way: https://stackoverflow.com/a/2930519
        AUTHORS=("''${(f)SELECTED_AUTHORS}")
        for AUTHOR in $AUTHORS[@]; do
          MESSAGE="''${MESSAGE}Co-authored-by:''${AUTHOR}\n"
        done

        if [[ "$1" == "-m" ]]; then
          git commit -m "$2$(echo -e ''${MESSAGE})"
        else 
          git commit $@ -t <(echo -e ''${MESSAGE})
        fi
      }

      # Load local settings
      if [[ -f .localrc ]]; then
        source .localrc
      fi
    '';

    defaultKeymap = "viins";

    shellAliases = {
      ls = "exa";
      l = "exa -la --git --time-style=long-iso";
      ".." = "cd ..";
      "..." = "cd .. && cd ..";
      "...." = "cd .. && cd .. && cd ..";

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

      cat = "bat";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };

    plugins = [
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
