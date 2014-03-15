[[ -s "/home/szymek/.rvm/scripts/rvm" ]] && source "/home/szymek/.rvm/scripts/rvm"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_locals ]; then
. ~/.bash_locals
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\u@\h: \W \e[0;32m\$(__git_ps1)\e[m\$ "

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
