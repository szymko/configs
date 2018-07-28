#!/bin/bash
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
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]λ\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1)$ '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
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

#from: https://github.com/driv/upto/blob/master/upto.sh
# The MIT License (MIT)
#
# Copyright (c) 2016 Federico Nafria
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# Status API Training Shop Blog About
function upto() {
	local EXPRESSION="$1"
	if [ -z "$EXPRESSION" ]; then
		echo "A folder expression must be provided." >&2
		return 1
	fi
	if [ "$EXPRESSION" = "/" ]; then
		cd "/"
		return 0
	fi
	local CURRENT_FOLDER="$(pwd)"
	local MATCHED_DIR=""
	local MATCHING=true

	while [ "$MATCHING" = true ]; do
		if [[ "$CURRENT_FOLDER" =~ "$EXPRESSION" ]]; then
			MATCHED_DIR="$CURRENT_FOLDER"
			CURRENT_FOLDER=$(dirname "$CURRENT_FOLDER")
		else
			MATCHING=false
		fi
	done
	if [ -n "$MATCHED_DIR" ]; then
		cd "$MATCHED_DIR"
		return 0
	else
		echo "No Match." >&2
		return 1
	fi
}

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

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

setjdk 1.8

if which pyenv > /dev/null; then export PATH="$HOME/.pyenv/bin:$PATH"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
