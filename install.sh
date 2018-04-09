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
# Install conditionally on macOS or Ubuntu
if [ "$(uname)" == "Darwin" ]; then
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
elif [ "$(uname)" == "Linux" ]; then
    # elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    ln -s ~/dotfiles/tmux-ubuntu.conf ~/.tmux.conf
fi
cp ~/dotfiles/tmux-status-line.conf ~/.tmux/tmux-status-line.conf
# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Sqlite
ln -s ~/dotfiles/.sqliterc ~/.sqliterc

# Vim
mkdir ~/.vim
mkdir ~/.vim/undo
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
