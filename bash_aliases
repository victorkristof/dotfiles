# System
alias dd="cd /Users/kristof/Desktop"
alias rd="cd /Users/kristof/GitHub"
alias ..="cd .."
alias ll="ls -AGFhop"
alias llt="ls -AGFhoptr"
alias llg="ls -AGFhop | grep"
alias lsg="ls | grep"
alias l="ls -GFhlp"
alias cp="cp -i"
alias mv="mv -i"
alias env="env | sort"

# Virutalenv
alias activate="source venv/bin/activate"

# Jupyter Notebook
alias nb="jupyter notebook"
alias nbn="jupyter notebook --no-browser"

# Git
alias s="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdt="git difftool"
alias gl="git log"
alias gu="git unstage"

# Platform-dependent aliases
if [ "$(uname)" == "Darwin" ]; then
    # macOS
    alias v="mvim -v"
    alias rm="trash"
    alias vv="vim ~/Documents/research/journal.md"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    alias v="vim"
    alias ls='ls --color=auto'
fi
