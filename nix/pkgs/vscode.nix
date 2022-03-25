
{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    userSettings = {
      "editor.tabSize" = 2;
      "editor.useTabStops" = false;
      "editor.cursorStyle" = "line";
      "editor.insertSpaces" = true;
      "editor.lineNumbers" = "relative";
      "editor.wordSeparators" = "/\\()\"':,.;<>~!@#$%^&*|+=[]{}`?-";
      "editor.wordWrap" = "off";
      "editor.fontFamily" = "PragmataPro Mono Liga";
      "editor.fontSize" = 15;
      "editor.formatOnSave" = true;
      "editor.renderWhitespace" = "all";
      "editor.autoClosingBrackets" = "always";
      "editor.inlineSuggest.enabled" = true;
      "editor.fontLigatures" = true;
      "editor.rulers" = [
          80
      ];
      "editor.tokenColorCustomizations" = {
          "textMateRules" = [
              {
                  "scope" = [ "comment" ];
                  "settings" = { 
                    "fontStyle" = "italic";
                  };
              }
          ];
      };
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = true;
      "editor.accessibilitySupport" = "off";

      "window.autoDetectColorScheme" = true;

      "workbench.colorTheme" = "GitHub Light Default";
      "workbench.iconTheme" = "file-icons";
      "workbench.preferredDarkColorTheme" = "GitHub Dark Default";
      "workbench.preferredLightColorTheme" = "GitHub Light Default";
      "workbench.startupEditor" = "none";

      "terminal.external.osxExec" = "iTerm.app";
      "terminal.integrated.fontFamily" = "PragmataPro Mono Liga";
      "terminal.integrated.fontSize" = 15;

      "vim.useSystemClipboard" = true;

      "git.autofetch" = true;

      "redhat.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";

      "go.toolsManagement.autoUpdate" = true;
      "go.buildTags" = "debug,integration";
      "go.lintTool" = "golangci-lint";
      "go.lintFlags" = [
          "--fast"
      ];
      "go.delveConfig" = {
          "debugAdapter" = "dlv-dap";
      };
      "gopls" = {
          "ui.codelenses" = {
              "gc_details" = true;
          };
      };

      # Needs https://marketplace.visualstudio.com/items?itemName=iocave.customize-ui
      # "window.titleBarStyle" = "native";
      # "customizeUI.titleBar" = "inline";
      # "customizeUI.activityBar" = "wide";
    };

    keybindings = [
      {
        key = "ctrl+tab";
        command = "workbench.action.nextEditor";
      }
      {
        key = "ctrl+shift+tab";
        command = "workbench.action.previousEditor";
      }
      {
        key = "cmd+t";
        command = "go.test.cursor";
      }
    ];

    extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        vscodevim.vim
        file-icons.file-icons
        github.copilot
        github.github-vscode-theme
        github.vscode-pull-request-github
        golang.go
        gruntfuggly.todo-tree
        # iocave.customize-ui (uncomment as soon as this exists)
        matklad.rust-analyzer
        usernamehw.errorlens
    ];
  };
}
