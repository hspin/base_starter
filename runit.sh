#!/usr/bin/env bash

DIR=tworktree

/run/current-system/sw/bin/rm -rf ./$DIR

mkdir -p ./$DIR
cd ./$DIR
touch readme.md
git init
