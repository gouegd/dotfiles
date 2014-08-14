# This bash file is intended for Mac OS X

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Mac stuff
export SVN_EDITOR=nano
alias st="open -a Sublime\ Text"
alias ..="cd .."
export PATH=/Applications/Android\ Studio.app/sdk/tools/:/Applications/Android\ Studio.app/sdk/platform-tools/:$PATH

bind Space:magic-space

# git-aware bash line
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
  source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
  export PS1='\[\e[7;33m\]$(__git_ps1 "%s")\[\e[0;36m\] \w\[\e[0m\] $ '
fi


# My (edited) previous Ubuntu bash_rc below

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias ls='ls -G'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#Add Ctrl+] shortcut to copy the current bash command
bind '"\C-]":"\C-e\C-u xclip <<"EOF"\n\C-y\nEOF\n"'
#Ctrl+G launches lfm
bind '"\C-G":"\C-e\C-ulfm\n"'

# Last file manager: stay in browsed directory on quit
lfm()
{
/usr/bin/lfm "$*"
LFMPATHFILE=/tmp/lfm-$$.path
cd "`cat $LFMPATHFILE`"
rm -f $LFMPATHFILE
}
