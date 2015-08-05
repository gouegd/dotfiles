local retStatus="%(?:%{$fg[green]%}>:%{$fg[red]%}🐛) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%} ↑"

PROMPT='${retStatus}%{$fg[cyan]%}%1~%{$reset_color%}$(git_prompt_info)$(git_prompt_status)$(if [ "$(git stash list 2>/dev/null)" != "" ]; then echo "%{$fg_bold[red]%} ☕︎"; fi) %{$reset_color%}'


