# Dot files

Step by step instructions to feel at home on any machine.

## Python

```
brew install python3
```

## Powerline
<https://powerline.readthedocs.io/en/latest/installation/osx.html>

```
pip3 install powerline-status
```

# Vim configuration

This folder contains the configurations and plugins that make me feel at home in `vim`.

## Usage

Clone this folder in the home directory of the user:
````
cd ~
git clone https://github.com/victorkristof/vim.git
````

Symlink the `.vimrc` file:
````
ln -s ~/.vim/.vimrc ~/.vimrc
````

Install the fonts:
````
cd menlo-for-vim/
open Menlo*
````

Install the plugins:
````
vim
:PlugInstall
````
