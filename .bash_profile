# This bash file is intended for Mac OS X

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Mac stuff
export PATH=/usr/local/bin:$PATH
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/gouegd/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export SVN_EDITOR=nano
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
export SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
alias st="open -a Sublime\ Text"
alias ..="cd .."

bind Space:magic-space

# git-aware bash line
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
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

alias grep='grep --color'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='terminal-notifier -message "Job done :)"'


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
lfm() {
/usr/local/bin/lfm "$*"
LFMPATHFILE=/tmp/lfm-$$.path
cd "`cat $LFMPATHFILE`"
rm -f $LFMPATHFILE
}

# returns the absolute path from a relative one 
abspath() {
  # $1 : relative filename
  if [ -d "$1" ]; then
      # dir
      echo "$(cd $1; pwd)"
  elif [ -f "$1" ]; then
      # file
      if [[ $1 == */* ]]; then
          echo "$(cd ${1%/*}; pwd)/${1##*/}"
      else
          echo "$(pwd)/$1"
      fi
  fi
}

# Use IntelliJ's diff on 2 files/folders
idiff() {
  idea='/Applications/IntelliJ IDEA 14 CE.app/Contents/MacOS/idea'
  left=`abspath $1`
  right=`abspath $2`
  "$idea" diff $left $right
}
