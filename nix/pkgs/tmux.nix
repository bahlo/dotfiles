{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "f";
    escapeTime = 0;
    baseIndex = 1;
    historyLimit = 10000000;
    keyMode = "vi";
    clock24 = true;
    sensibleOnTop = true;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    terminal = "tmux-256color";
    extraConfig = ''
      # Re-number windows when one is closed
      set -g renumber-windows on

      # Show times longer than supposed
      set -g display-panes-time 2000

      # Toogle last window by hitting again C-f
      bind-key C-f last-window

      # Highlight window when it has new activity
      setw -g monitor-activity on
      set -g visual-activity on

      # Split horiziontal and vertical splits, instead of % and "
      bind-key v split-window -h -c '#{pane_current_path}'
      bind-key s split-window -v -c '#{pane_current_path}'

      # Select and copy with v and y, instead of default space and enter
      bind-key -T edit-mode-vi Up send-keys -X history-up
      bind-key -T edit-mode-vi Down send-keys -X history-down
      unbind-key -T copy-mode-vi Space     ;   bind-key -T copy-mode-vi v send-keys -X begin-selection
      unbind-key -T copy-mode-vi Enter     ;   bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
      unbind-key -T copy-mode-vi C-v       ;   bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      unbind-key -T copy-mode-vi [         ;   bind-key -T copy-mode-vi [ send-keys -X begin-selection
      unbind-key -T copy-mode-vi ]         ;   bind-key -T copy-mode-vi ] send-keys -X copy-selection

      # Mouse mode on
      set -g terminal-overrides 'xterm*:smcup@:rmcup@'
      set -g mouse on

      # Set title
      set -g set-titles on
      set -g set-titles-string "#T"

      # Equally resize all panes
      bind-key = select-layout even-horizontal
      bind-key | select-layout even-vertical
    '';
  };
}