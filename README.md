dotvim
======

##VIM 8:

Clone repo:

    git clone git@github.com:edyrhaug/dotvim.git ~/.vim --branch v8

Create symlink and swp directory:

    ln -s ~/.vim/vimrc ~/.vimrc
    mkdir ~/.vim/.swp
    mkdir -p ~/.vim/pack/minpac/opt

Set up minpack:

    mkdir -p ~/.vim/pack/minpac/opt
    cd ~/.vim/pack/minpac/opt
    git clone https://github.com/k-takata/minpac.git

Run vim and install packages:

    vim
>In vim run `PackageUpdate`

-------------------
##VIM 7:

Clone repo:

    git clone git@github.com:edyrhaug/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

If you want to update all submodule repos:

    git submodule foreach git pull origin master
