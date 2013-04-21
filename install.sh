#!/bin/bash

#install prezto (https://github.com/dstibrany/prezto)
echo 'installing prezto...'

git submodule update --init --recursive

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/ "${ZDOTDIR:-$HOME}"/.zprezto

echo '...done installing prezto'

#backup old bin directory
echo "backing up ${ZDOTDIR:-$HOME}/bin"

if [ -d "${ZDOTDIR:-$HOME}"/bin ]; then
	echo "OK"
	echo "${ZDOTDIR:-$HOME}"/bin
	cp -r "${ZDOTDIR:-$HOME}"/bin "${ZDOTDIR:-$HOME}"/dotfiles/backup
	rm -rf "${ZDOTDIR:-$HOME}"/bin
fi

#link new bin directory
echo "linking ${ZDOTDIR:-$HOME}/bin"

ln -s "${ZDOTDIR:-$HOME}"/dotfiles/bin "${ZDOTDIR:-$HOME}"/bin


