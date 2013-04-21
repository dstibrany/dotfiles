#!/bin/bash

DOTFILESHOME="${ZDOTDIR:-$HOME}"

echo "uninstalling zprezto"

rm "$DOTFILESHOME"/.z*

echo "removing current dotfiles"

for rcfile in "$DOTFILESHOME"/dotfiles/runcoms/*; do
	rm -f "$DOTFILESHOME/.${rcfile##*/}"
done

echo "restoring old dotfiles"

shopt -s dotglob

for rcfile in "$DOTFILESHOME"/dotfiles/backup/runcoms/*; do
	mv $rcfile "$DOTFILESHOME"
done

shopt -u dotglob


echo "restoring bin folder"

rm "$DOTFILESHOME"/bin
cp -r "$DOTFILESHOME"/dotfiles/backup/bin "$DOTFILESHOME"
rm -rf "$DOTFILESHOME"/dotfiles/backup

unset DOTFILESHOME

echo "done uninstalling dotfiles"
