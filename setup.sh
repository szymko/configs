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
    if [ -f $HOME/"$file" ]; then
      rm $HOME/"$file"
    fi
    ln "$file" $HOME/"$file"
  done
}

cp .bashrc .profile

if [[ $OSTYPE =~ "darwin1" ]]; then
  bash_profile=".profile"
else
  bash_profile=".bashrc"
fi

conf_backup $bash_profile .bash_aliases .gitconfig .inputrc .vimrc
conf_link $bash_profile .bash_aliases .gitconfig .inputrc .vimrc

rm .profile
