#!/usr/bin/env bash

DIR=tworktree

mkdir -p ./$DIR/notes
touch ./$DIR/index.norg
touch ./$DIR/notes/requirements.norg
cd ./$DIR

git switch -c holding

git worktree add features -b features

git worktree add master

