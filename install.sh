#!/bin/bash

DOTFILESHOME="${ZDOTDIR:-$HOME}"

# make backup folder for old dotfiles
mkdir -p "$DOTFILESHOME"/dotfiles/backup/runcoms

#install prezto (https://github.com/dstibrany/prezto)
echo 'installing prezto'

git submodule update --init --recursive

for rcfile in "$DOTFILESHOME"/dotfiles/.zprezto/runcoms/*; do
    if [ ! "${rcfile##*/}" = "README.md" ]; then
        ln -s "$rcfile" "$DOTFILESHOME/.${rcfile##*/}"
    fi
done

ln -s "$DOTFILESHOME"/dotfiles/.zprezto/ "$DOTFILESHOME"/.zprezto

# backup and copy all .rc files 
echo "backing up old dotfiles and linking in new ones"

for rcfile in "$DOTFILESHOME"/dotfiles/runcoms/*; do
	
    # backup old dotfile, if it exists
	if [ -f "$DOTFILESHOME/.${rcfile##*/}" ]; then
	    mv "$DOTFILESHOME/.${rcfile##*/}" "$DOTFILESHOME"/dotfiles/backup/runcoms
	fi
	
    # link new dotfile
	ln -s "$rcfile" "$DOTFILESHOME/.${rcfile##*/}"
done

#backup old bin directory
echo "backing up $DOTFILESHOME/bin"

if [ -d "$DOTFILESHOME"/bin ]; then
    mkdir -p "$DOTFILESHOME"/dotfiles/backup
    cp -r "$DOTFILESHOME"/bin "$DOTFILESHOME"/dotfiles/backup
    rm -rf "$DOTFILESHOME"/bin
fi

#link new bin directory
echo "linking $DOTFILESHOME/bin"

ln -s "$DOTFILESHOME"/dotfiles/bin "$DOTFILESHOME"/bin

unset DOTFILESHOME


