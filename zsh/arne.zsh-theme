function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[magenta]%}(ssh) ›"
  fi
}

# Backup: ‹›

PROMPT='%{$fg_bold[red]%}%n%{$reset_color%} › %{$fg_bold[green]%}%m%{$reset_color%} › %{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)% %{$reset_color%}$ '

ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="› %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
