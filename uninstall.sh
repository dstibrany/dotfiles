#!/bin/bash

DOTFILESHOME="${ZDOTDIR:-$HOME}"

echo -e "uninstalling zprezto...\n"

for rcfile in "$DOTFILESHOME"/dotfiles/.zprezto/runcoms/*; do
    if [ ! "${rcfile##*/}" = "README.md" ]; then
        rm -f "$DOTFILESHOME/.${rcfile##*/}"
    fi
    rm -f "$DOTFILESHOME/.zprezto" 
done

echo "removing current dotfiles"

for rcfile in "$DOTFILESHOME"/dotfiles/runcoms/*; do
    rm -f "$DOTFILESHOME/.${rcfile##*/}"
done

echo "restoring old dotfiles"

shopt -s dotglob

for rcfile in "$DOTFILESHOME"/dotfiles/backup/runcoms/*; do
    if [ -f "$rcfile" ]; then
        mv $rcfile "$DOTFILESHOME"
    fi
done

shopt -u dotglob


echo "restoring bin folder"

rm "$DOTFILESHOME"/bin
if [ -d "$DOTFILESHOME"/dotfiles/backup/bin ]; then
    cp -r "$DOTFILESHOME"/dotfiles/backup/bin "$DOTFILESHOME"
fi
rm -rf "$DOTFILESHOME"/dotfiles/backup

unset DOTFILESHOME

echo -e "\n...done uninstalling dotfiles"
