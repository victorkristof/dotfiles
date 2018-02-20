# System
alias dd="cd /Users/kristof/Desktop"
alias gd="cd /Users/kristof/GitHub"
alias ..="cd .."
alias ll="ls -AGFhlp"
alias l="ls -GFhlp"

# Virutalenv
alias activate="source venv/bin/activate"

# Jupyter Notebook
alias nb="jupyter notebook"
alias nbn="jupyter notebook --no-browser"

# Git
alias s="git status"
alias ga="git add"
alias gc="git commit"

# Platform-dependent aliases
if [ "$(uname)" == "Darwin" ]; then
    # macOS
    alias v="mvim -v"
    alias rm="trash"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    alias v="vim"
    alias ls='ls --color=auto'
fi
