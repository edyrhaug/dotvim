dotvim
======

Installation:

    git clone https://github.com/edyrhaug/dotvim.git

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Update all submodule repos:

    git submodule foreach git pull origin master
