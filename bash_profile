# Source .bashrc to load config from distant login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# User install (Homebrew) program have priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set URL for databases
# export SOCCERWAY_DB_URL="sqlite:////Users/kristof/GitHub/kickoff.ai/kickoff-sci/data/sw-with-clubs-2018-05-18.db"
export SOCCERWAY_DB_URL="sqlite:////Users/kristof/GitHub/kickoff.ai/kickoff-sci/data/soccerway-2018-04-23-v2.db"
export PARL_DB="sqlite:////Users/kristof/GitHub/parl/data/data/db/parl-7.db"
export EUROLEX_DB="sqlite:////Users/kristof/GitHub/parl/data/data/db/eurolex-8.db"
export PREDIKON_DB="sqlite:////Users/kristof/GitHub/predikon/v2/data/db/predikon.db"

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export BAT_CONFIG_PATH="/Users/kristof/.batrc"

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Set man to use bat for page coloring.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kristof/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kristof/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/kristof/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kristof/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Bash completion.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
