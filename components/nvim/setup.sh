#!/bin/bash

DIR=$1

CONFIG_FILE="init.vim"
TARGET_DIR="$HOME/.config/nvim"

# Cleaning and recreating the world
rm -r $TARGET_DIR 2> /dev/null
mkdir -p $TARGET_DIR

echo "linking"
ln -s "$DIR/$CONFIG_FILE" "$TARGET_DIR/$CONFIG_FILE"
echo "$(ls -a $TARGET_DIR)"
echo "$TARGET_DIR"

curl -fLo "$DIR/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$DIR/autoload" "$TARGET_DIR/autoload"

