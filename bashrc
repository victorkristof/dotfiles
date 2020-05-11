# Sets term colors for vim to work with Solarised in tmux
# if [ -n $TMUX ]; then
#    alias vim="TERM=screen-256color vim"
# fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Setup prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Enable fancy autocompletion for scp
# if [ -f /usr/local/etc/bash_completion ]; then
#     source /usr/local/etc/bash_completion
# fi

# Set up virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# History configuration
bind '"\e[A": history-search-backward' # Search backward on up arrow
bind '"\e[B": history-search-forward'  # Search forward on down arrow
export HISTCONTROL=ignoreboth          # Don't save duplicates

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Set cd binding to Alt-O
bind '"\eo": " \C-e\C-u`__fzf_cd__`\e\C-e\er\C-m"'
# Overwrite Alt-C binding to get readline mapping for capitalize word.
bind '"\ec": capitalize-word'
