#!/bin/bash

echo "Uninstalling dotfiles..."

rm "${ZDOTDIR:-$HOME}"/.z*

echo "...done uninstalling dotfiles"

echo "restoring bin folder"

rm "${ZDOTDIR:-$HOME}"/bin
cp -r "${ZDOTDIR:-$HOME}"/dotfiles/backup/bin "${ZDOTDIR:-$HOME}"
rm -rf "${ZDOTDIR:-$HOME}"/dotfiles/backup/bin
