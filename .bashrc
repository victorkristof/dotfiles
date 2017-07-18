# Aliases
alias dd="cd /Users/kristof/Desktop"
alias gd="cd /Users/kristof/GitHub"
alias ..="cd .."
alias ll="ls -AGFhlp"
alias activate="source venv/bin/activate"
alias nb="jupyter notebook"
alias v="mvim -v"
alias rm="trash"

# Sets term colors for vim to work with Solarised in tmux
# if [ -n $TMUX ]; then
#    alias vim="TERM=screen-256color vim"
# fi

# Set up virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# History configuration
bind '"\e[A": history-search-backward' # Search backward on up arrow
bind '"\e[B": history-search-forward'  # Search forward on down arrow
export HISTCONTROL=ignoreboth          # Don't save duplicates

echo "Bienvenue !"
