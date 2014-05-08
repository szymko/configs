## Bash aliases ##

## File functions & utilities
function updated_at(){
	stat -c %y $1 | awk '{printf $1 "\n"}'
}

function proff(){
  export http_proxy=''
  export https_proxy=''
  export no_proxy=''
  export ftp_proxy=''
}

function pron(){
  source /etc/environment
}

function git_push_self() {
  branch=`git rev-parse --abbrev-ref HEAD`
  `git push origin $branch`
}

alias updated='updated_at'
alias t='tail'
alias h='head'

## Keep 1000 lines in .bash_history (default is 500)
export HISTSIZE=1000
export HISTFILESIZE=1000

#Stop bash from caching duplicate lines.
HISTCONTROL=ignoredups

## Disk free in human terms
alias df='df -h'

## List paths
alias path='echo -e ${PATH//:/\\n}'

## Alias ls command
alias la='ls -a'

## Reload .bashrc
alias reload='source $HOME/.bashrc'
alias showalias='cat $HOME/.bash_aliases'

## Search
#search processes
alias p_search='ps aux |grep '

## System control
alias shutd='sudo shutdown -P now'
alias shutr='sudo shutdown -r now'
alias diag='gkrellm'

## Package control
alias apt-install='sudo apt-get install'
alias apt-update='sudo apt-get update'
alias apt-upgrade='sudo apt-get upgrade'

## Rails
alias be='bundle exec'
alias pry_console='pry -r ./config/environment.rb'
alias bi_multi='bundle install -j4'

## Git
alias g_cert_problem='git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt'
alias g='git'
alias ps_self='git_push_self'

## Heroku
alias heroku_ssh 'ssh-add ~/.ssh/heroku'
