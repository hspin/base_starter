#!/bin/bash

DIR=$(pwd)
HNAME=${PWD##*/}

newname="${HNAME// /-}"
HNAME=$( echo -n "${newname}" | sed 's/^ *//;s/ *$//' )

# sessions

rm -f $HOME/.vim/sessions/$HNAME.vim
ln -s $DIR/.sessions/"${HNAME}-mks" $HOME/.vim/sessions/$HNAME.vim

echo "${HNAME}-mks - session is ready"
echo "*******************************"

# tmuxinator

rm -f $HOME/.tmuxinator/$HNAME.yml
ln -s $DIR/.general-tmuxinator.yml $HOME/.tmuxinator/p-$HNAME.yml

echo "${HNAME} - tmuxinator is ready"
echo "*******************************"
