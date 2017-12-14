# Sets term colors for vim to work with Solarised in tmux
# if [ -n $TMUX ]; then
#    alias vim="TERM=screen-256color vim"
# fi

# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Setup prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set up virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# History configuration
bind '"\e[A": history-search-backward' # Search backward on up arrow
bind '"\e[B": history-search-forward'  # Search forward on down arrow
export HISTCONTROL=ignoreboth          # Don't save duplicates
