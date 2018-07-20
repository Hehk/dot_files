#!/bin/bash

DIR="$1"

# Files
CONFIG=".gitconfig"
IGNORE_GLOBAL=".gitignore_global"
COMMIT_TEMPLATE="commitTemplate"

# Setup the config
rm "$HOME/$CONFIG"
ln -s "$DIR/$CONFIG" "$HOME/$CONFIG"

git config --global core.excludesfile "$DIR/$IGNORE_GLOBAL"
git config --global commit.template "$DIR/$COMMIT_TEMPLATE"

