[[ -s "/home/szymek/.rvm/scripts/rvm" ]] && source "/home/szymek/.rvm/scripts/rvm"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_alias_local ]; then
. ~/.bash_alias_local
fi

if [ -f ~/.bash_locals ]; then
. ~/.bash_locals
fi

if which rbenv > /dev/null; then export PATH="$HOME/.rbenv/bin:$PATH"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
#export PS2="\u@\h: \W \e[0;32m\$(__git_ps1)\e[m\$"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1)$ '

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi


set_ruby_env_vars() {
  if command -v ruby >/dev/null 2>&1; then
    OldRuby=`ruby -e "puts RUBY_VERSION =~ /(1|2)\.(8|9|0).\d/" 2> /dev/null`

    export RUBY_GC_MALLOC_LIMIT=90000000

    if [ -n "$OldRuby" ]; then
      unset RUBY_GC_HEAP_FREE_SLOT
      export RUBY_FREE_MIN=200000
    else
      unset RUBY_FREE_MIN
      export RUBY_GC_HEAP_FREE_SLOT=20000
    fi
  fi
}

export PROMPT_COMMAND=set_ruby_env_vars
export GIT_EDITOR=vim
export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
export HISTCONTROL=ignoredups

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME/bin
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setjdk 1.7
