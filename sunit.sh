#!/usr/bin/env bash

DIR=tworktree

mkdir -p ./$DIR/notes
touch ./$DIR/index.norg
cd ./$DIR

git switch -c dummy

git worktree add features -b features

git worktree add master

