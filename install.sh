#!/bin/sh

#install prezto (https://github.com/dstibrany/prezto)
echo 'installing prezto...'

git submodule --quiet update --init --recursive

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo '...done installing prezto'