dotfiles
========

features
--------
- can be installed and uninstalled with one command
- uses zprezto as zsh framework
- bash support
- backs up any existing dotfile that would be overwritten
- all dotfiles are symlinks to files in the /dotfiles dir, so keeping things in sync with git is easy
- great Vim and Tmux support (plugins, themes, defaults)

how to install
--------------
    cd ~ && git clone https://github.com/dstibrany/dotfiles.git && cd dotfiles && ./install.sh

All existing dotfiles that would have been overwritten are moved to ~/dotfiles/backup/runcoms

Anything that was in your ~/bin will be moved to ~/dotfiles/backup/bin

how to uninstall
----------------
    dotfiles uninstall

All your old dotfiles will be then be restored.

how to pull down upstream changes
---------------------------------
    dotfiles pull

This will ensure that your dotfiles are updated with the latest changes.

how to push your changes upstream
---------------------------------
    dotfiles push

Support for the feature is coming soon.

###todo

- autoinstall lesspipe and source-highlight
- dotfiles push command
- make function `git-current-branch` work in bash
- get `dirs` stuff working in bash
- more osx defaults
- get ctrl-backspace working with bash
- updating submodules of zprezto is f'd up, need a better workflow for pulling in upstream zprezto changes
