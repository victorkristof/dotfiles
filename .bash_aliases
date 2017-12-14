alias dd="cd /Users/kristof/Desktop"
alias gd="cd /Users/kristof/GitHub"
alias ..="cd .."
alias ls='ls --color=auto'
alias ll="ls -AGFhlp"
alias l="ls -AGFhlp"
alias activate="source venv/bin/activate"
alias nb="jupyter notebook"
alias nbn="jupyter notebook --no-browser"
alias s="git status"

# Platform-dependent aliases
if [ "$(uname)" == "Darwin" ]; then
    # macOS
    alias v="mvim -v"
    alias rm="trash"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    alias v="vim"
fi
