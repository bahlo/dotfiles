# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%} at %{$fg[green]%}%m%{$reset_color%}'
local current_dir='in %{$terminfo[bold]$fg[blue]% %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="at %{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
