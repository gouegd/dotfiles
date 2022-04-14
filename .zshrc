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
plugins=(macos fasd)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin"
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
export ANDROID_HOME=~/Library/Android/sdk
# export SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# alias json='python -m json.tool | pygmentize -l json'
alias json='tee ~/lastfx.json | fx'
alias fxx='fx ~/lastfx.json'
alias grep='grep --color'
alias t='tig status'
alias jira='fn() { open https://vendhq.atlassian.net/jira/software/projects/PAY/boards/$1 };fn'

# rust, rustup, cargo
# export PATH="$HOME/.cargo/bin:$PATH"

# function av() {
# if [[ $1 == "-h" ]];then
#     echo -e "Usage: $0 [role-to-assume] command"
#     echo -e ""
#     echo -e "If a role is not provided, it will exit as the default behaviour is to drop you in a subshell."
#     echo -e "To add another role, edit the av() function in your ~/.zshrc or ~/.bashrc."
#     echo -e "Make sure to configure the role in your ~/.aws/config file as well."
#     return 0
# fi
#     if [[ $# -ge 2 ]]; then
#         case $1 in
#             engineer)
#                 aws-vault exec engineer -- ${@:2}
#             ;;
#             *)
#                 echo "Unknown profile $1. Exiting."
#             ;;
#         esac
#     else
#         echo "No command detected. Exiting."
#     fi
# }

# NVM for zsh
# source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# AWS Vault info
# if [[ $AWS_VAULT ]]; then
#     export PS1=$PS1$'\e[0;32m('$AWS_VAULT$')\e[0m '
# fi

# Go
export GOPATH=~/go
# export GOPRIVATE="github.com/vend"

export PATH="$GOPATH/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

function jwt_decode(){
    jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}

# Our ECR address
export ecr=542640492856.dkr.ecr.us-west-2.amazonaws.com

# Below AWS configs from https://github.com/vend/home/blob/master/variables.sh
# For most engineers, they likely want to use the engineer role so we
# should default to that out of the box. AWS_PROFILE has precident over
# this role however so if you're looking to do a few commands with elevated
# privileges or want to override this shell script, you should set AWS_PROFILE
# or use the --profile flag
export AWS_DEFAULT_PROFILE=team-payments
export AWS_DEFAULT_REGION=us-west-2

# By default, the AWS credential check doesn't check ~/.aws/config when
# checking for credential sources. We have ~/.aws/config use
# saml2aws as a `credential_process` where it invokes saml2aws and returns
# a SAML response. In order to authenticate Terraform + applications that use
# the SDK, we can tell the SDK to load the config, which indirectly triggers
# the credential process. In short, this lets us have a flow like so:
# terraform plan -> aws cli -> aws config -> saml2aws -> trigger onelogin mfa
# -> aws cli receives creds -> carry on as normal
export AWS_SDK_LOAD_CONFIG=true

# This allows us to retrieve packages from Github since most repos are private
export GOPRIVATE="github.com/vend"

# vend functions for aws (mainly aws-envs)
# source ~/code/home/functions.sh
