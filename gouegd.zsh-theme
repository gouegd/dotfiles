local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%})> "
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='${ret_status}%{$fg[cyan]%}%1~%{$reset_color%}$(git_prompt_info) '
