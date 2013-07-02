#!/bin/bash

DOTFILESHOME="${ZDOTDIR:-$HOME}"

cd "$DOTFILESHOME"/dotfiles

if [ -n "$(git status --porcelain)" ]; then
    echo "You have uncommited changes, please commit your changes first"
else
    # update everything
    git pull
    git submodule update --recursive
    
    # link new runcoms
    for rcfile in "$DOTFILESHOME"/dotfiles/runcoms/*; do
        if [ ! -f "$DOTFILESHOME/.${rcfile##*/}" ]; then
            # link new dotfile
            echo "adding .${rcfile##*/}"
            ln -s "$rcfile" "$DOTFILESHOME/.${rcfile##*/}"
        fi
    done
fi