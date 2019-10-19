#!/bin/sh

### SHELL

ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile

### INPUT

ln -s ~/dotfiles/inputrc ~/.inputrc
source ~/.inputrc

### GIT
ln -s ~/dotfiles/gitconfig ~/.gitconfig

### TMUX

# Install conditionally on macOS or Ubuntu.
if [ "$(uname)" == "Darwin" ]; then
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
elif [ "$(uname)" == "Linux" ]; then
    ln -s ~/dotfiles/tmux-ubuntu.conf ~/.tmux.conf
fi
cp ~/dotfiles/tmux-status-line.conf ~/.tmux/tmux-status-line.conf
# Install tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### VIM

mkdir -p ~/.vim/undo
ln -s ~/dotfiles/vimrc ~/.vimrc
# Install VimPlug.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install all plugins.
vim +PlugInstall +qall

### SQLITE
ln -s ~/dotfiles/sqliterc ~/.sqliterc

### PYTHON

# Install utils.
mkdir ~/GitHub
cd ~/GitHub
git clone https://github.com/victorkristof/utils.git

### BAT

# Install with homebrew.
brew install bat
# Setup Solarized theme.
mkdir -p .config/bat/themes
cd Solarized
# Checkout to correct theme definition.
git checkout 87e01090cf
cd ..
# Enable theme.
bat cache --build
# Enable config.
ln -s ~/dotfiles/batrc ~/.batrc

echo "Welcome home."
