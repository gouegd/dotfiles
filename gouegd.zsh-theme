local retStatus="%(?:%{$fg[green]%}√:%{$fg[red]%}🐛) "

#info
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#status
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[magenta]%} ↑"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[red]%} ♥"

ZSH_THEME_AWS_PREFIX="("
ZSH_THEME_AWS_SUFFIX=")"
SHOW_AWS_PROMPT=false
PROMPT='${retStatus}%{$fg[cyan]%}%1~%{$reset_color%}$(git_prompt_info)$(git_prompt_status) %{$reset_color%}'
