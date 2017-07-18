# Dot files

Step by step instructions to feel at home on any machine.

## Python

```
brew install python3
```

## tmux status line

The tmux status line is sourced from `tmux-status-line.conf`. This file is generated from `.vimrc` in order to inherit its theme. See `TMUXLINE` section.

In order to have a prefix indicator (in my case, the part A becomes blue), replace the following line in `tmux-status-line.conf`:

````
set -g status-left "#{?client_prefix,#[fg=colour7]#[bg=colour4]#[bold],#[fg=colour7]#[bg=colour11]#[bold]} #S #{?client_prefix,#[fg=colour4]#[bg=colour7],#[fg=colour11]#[bg=colour7]}#[nobold]#[nounderscore]#[noitalics]"
````

The `#{?variable, if-true, if-false}` block is a bit special. If the formatting code in `if-true` or `if-false` contains a comma or a closing bracket, the block breaks. Therefore it is important to separate the styling blocks `[]` and not nest them as usual!.

**Note:** The prefix indicator part is added manually after the status line has been generated. Therefore if you generate another status style, you have to add that manually.

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

# Tmux configuration

## Copy-paste
Copy-paste between tmux and Mac OS X doesn't work by default, you need to reattach the name space first:

````
brew install reattach-to-user-namespace
````

The rest is handled by `.tmux.conf`.

## Enable italics

You need to create a new terminal definition that can print italic characters.
To do so, start by creating a new file `tmux.terminfo`:

```
vim ~/tmux.terminfo
```

And copy-paste the following lines:

```
# A screen-256color based TERMINFO that adds the escape sequences for italic.
# run to add to term db: tic tmux.terminfo
tmux|tmux terminal multiplexer,
  ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
  use=xterm, use=screen,

tmux-256color|tmux with 256 colors,
  use=xterm-256color, use=tmux,
```

Finally, add it to the terminfo database:

```
tic -x tmux.terminfo
```

In your `tmux.conf`, add the following:

```
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm*:sitm=\E[3m'
```

Restart tmux `tmux kill-server` and you're done.

