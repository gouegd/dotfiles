# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="sunrise"
#ZSH_THEME="bureau"
#ZSH_THEME="norm"
ZSH_THEME="gouegd"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx fasd)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
export ANDROID_HOME=~/Library/Android/sdk
# export SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#Greg: From http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
#
alias calc='bc -l'
### Show hidden files ##
alias l.='ls -d .*'
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias ls='ls -G'
#
alias bc='bc -l'
## Allow mkdir foo/bar even if foo does not exist yet
alias mkdir='mkdir -pv'
## Colourful diff
alias diff='colordiff'
##Prettier mount
alias mount='mount |column -t'
#
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias ports='netstat -tulanp'
alias su='sudo -i'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
##wget resume
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
#
alias psg='ps -ef | grep'
alias lt='ls -alFrt'
#
alias pstree='pstree -G'
alias json='python -m json.tool | pygmentize -l json'
alias grep='grep --color'
alias t='tig status'
alias jira='fn() { open https://debitsuccess.atlassian.net/browse/CRMWEB-$1 };fn'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Elmenv
#export PATH="$HOME/.elmenv/bin:$PATH"
#eval "$(elmenv init -)"
# Go
#export GOPATH="$HOME/gocode"
#export PATH="$GOPATH/bin:$PATH"
# yarn
#export PATH="$PATH:`yarn global bin`"
# Android
#export PATH=${PATH}:${ANDROID_HOME}/tools
#export PATH=${PATH}:${ANDROID_HOME}/platform-tools
# AWS
export PATH=${PATH}:~/Library/Python/2.7/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/gregory.D/.nvm/versions/node/v10.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/gregory.D/.nvm/versions/node/v10.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/gregory.D/.nvm/versions/node/v10.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/gregory.D/.nvm/versions/node/v10.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/gregory.D/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/gregory.D/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh