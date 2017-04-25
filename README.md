dotvim
======

Installation:

    git clone git@github.com:edyrhaug/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

If you want to update all submodule repos:

    git submodule foreach git pull origin master
