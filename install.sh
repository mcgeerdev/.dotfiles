#!/usr/bin/env bash

pushd .

# Check if STOW_FOLDERS variable is set
if [ -z $STOW_FOLDERS ]; then
    echo "Error: STOW_FOLDERS variable is not set."
    exit 1
fi

pushd . || { echo "Error: Unable to push directory onto the stack."; exit 1; }
for folder in $(echo "$STOW_FOLDERS" | sed "s/,/ /g")
do
    stow -D $folder || { echo "Error: Unable to unstow $folder."; popd; exit 1; }
    stow $folder || { echo "Error: Unable to stow $folder."; popd; exit 1; }
done
popd || { echo "Error: Unable to pop directory off the stack."; exit 1; }

# Point Git at the tracked hooks directory. core.hooksPath is local config, so
# a fresh clone has no secret scan until this runs.
git -C "$(dirname "${BASH_SOURCE[0]}")" config core.hooksPath githooks \
    || { echo "Error: Unable to set core.hooksPath."; exit 1; }
