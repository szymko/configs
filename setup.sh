#! /bin/bash

function conf_backup {
  for file in "$@"
  do
    if [ -f $HOME/"$file" ]; then
      mv $HOME/"$file" $HOME/"$file".backup
    fi
  done
}

function conf_link {
  for file in "$@"
  do
    ln "$file" $HOME/"$file"
  done
}

conf_backup .bashrc .bash_aliases .gitconfig .inputrc

conf_link .bashrc .bash_aliases .gitconfig .inputrc
