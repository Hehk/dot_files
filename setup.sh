#!/bin/bash
# Get the current dir of this file
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
SETUP="test.sh"

for COMP in components/* ; do
  if [ -f "$COMP/$SETUP" ]; then
    echo "\nRunning $COMP"
    bash "$COMP/$SETUP" "$DIR/$COMP"
  fi
done
