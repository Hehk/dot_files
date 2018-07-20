#!/bin/bash

DIR=$1
CONFIG_FILE=".tmux.conf"

rm "$HOME/$CONFIG_FILE"
ln -s "$DIR/$CONFIG_FILE" "$HOME/$CONFIG_LOC"

# Install TPM
rm -rf "$DIR/tpm"
git clone https://github.com/tmux-plugins/tpm "$DIR/tpm"
