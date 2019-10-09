#!/bin/bash

DIR=$(pwd)
HNAME=${PWD##*/}

sed -i "s/uno11/${HNAME}/" .general-tmuxinator.yml

sed -i "s|dos22|${DIR}/|" .general-tmuxinator.yml

ln -s $DIR/.general-tmuxinator.yml $HOME/.tmuxinator/$HNAME.yml

echo "tmuxinator is ready"
echo "*******************************"
