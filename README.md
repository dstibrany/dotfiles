dotfiles
========

how to install
----------
    cd ~
    git clone git@github.com:dstibrany/dotfiles.git 
    cd dotfiles
    ./install.sh

All existing dotfiles that would have been overwritten are moved to ~/dotfiles/backup/runcoms

Anything that was in your ~/bin will be moved to ~/dotfiles/backup/bin

how to uninstall
----------------
    cd ~/dotfiles
    ./uninstall.sh

All your old dotfiles will be then be restored.

features
--------
- can be installed and uninstalled in with one command
- uses zprezto as zsh framework
- bash support
- backs up and existing dotfile that would be overwritten
- all dotfiles are symlinks to files in the /dotfiles dir, so keeping things in sync with git is easy

todo
----
- make function git-current-branch work in bash
- get dirs stuff working in bash
- .vimrc support
- sublime defaults support
- more osx defaults
- get ctrl-backspace working with bash
- figure out a way to easily load some iterm defaults

bugs
----
- zsh-syntax-highlighting root module causes growls on keypresses
- figure out which file to add npm/bin folder to path
- get a good set of LESS options going