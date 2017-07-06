alias cdesk="cd /Users/victor/Desktop"
alias ll="ls -Ahlp"
alias ..="cd .."
alias epfl51="cd '/Users/victor/Documents/ EPFL/Année 5/Semestre 1'"
alias gdir="cd /Users/victor/GitHub"
alias activate="source venv/bin/activate"
alias nb="jupyter notebook"
alias vim="mvim"
alias rm="trash"

echo "Bienvenue !"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

### History
HISTCONTROL=ignoredups
