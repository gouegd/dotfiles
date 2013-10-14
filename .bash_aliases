#Greg: From http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

alias calc='bc -l'
## Show hidden files ##
alias l.='ls -d .* --color=auto'

alias bc='bc -l'
# Allow mkdir foo/bar even if foo does not exist yet
alias mkdir='mkdir -pv'
# Colourful diff
alias diff='colordiff'
#Prettier mount
alias mount='mount |column -t'

alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias vi=vim
alias ports='netstat -tulanp'
alias apt-get="sudo apt-get"
alias su='sudo -i'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
#wget resume
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias psg='ps -ef | grep'
alias lt='ls -alFrt'

alias st=subl
alias pstree='pstree -G'
#Not the actual credentials :)
alias sql='mysql -utest -ptest case_7722'
#
alias mvn_create_install='mvn project:local-create-install-sql'
