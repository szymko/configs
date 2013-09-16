#! /bin/bash

function conf_backup {
  for file in "$@"
  do
    mv $HOME/"$file" $HOME/"$file".backup
  done
}

function conf_link {
  for file in "$@"
  do
    ln "$file" $HOME/"$file"
  done
}

conf_backup .bashrc .bash_aliases .gitconfig

conf_link .bashrc .bash_aliases .gitconfig
