#!/bin/bash

cd ~/

sudo apt-get update
sudo apt-get install -y vim yakuake xclip curl dconf-cli

mkdir ~/.vim
mkdir ~/.vim/autoload ~/.vim/bundle ~/.vim/backup ~/.vim/swap ~/.vim/undo

cd -

cp .bash_aliases ~/.bash_aliases
cp .vimrc ~/.vimrc
cp .profile ~/.profile
cp .Xmodmap ~/.Xmodmap

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vim +PluginInstall +qall


