[[ -s "/home/szymek/.rvm/scripts/rvm" ]] && source "/home/szymek/.rvm/scripts/rvm"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_locals ]; then
. ~/.bash_locals
fi

# Ruby settings
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000
