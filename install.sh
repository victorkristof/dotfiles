#!/bin/sh

# Shell
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
source ~/.bash_profile

# Input
ln -s ~/dotfiles/.inputrc ~/.inputrc
source ~/.inputrc

# Tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Vim

mkdir ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install all plugins
vim +PlugInstall +qall

# Python

mkdir ~/GitHub
cd ~/GitHub
git clone https://github.com/victorkristof/utils.git

echo "Welcome home."
