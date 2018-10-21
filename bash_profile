# Source .bashrc to load config from distant login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# User install (Homebrew) program have priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set URL for databases
export SOCCERWAY_DB_URL="sqlite:////Users/kristof/GitHub/kickoff.ai/kickoff-sci/data/soccerway-2018-04-23-v2.db"
export PARL_DB="sqlite:////Users/kristof/GitHub/lobby/lobby-wbap/data/parl.db"
export EUROLEX_DB="sqlite:////Users/kristof/GitHub/lobby/lobby-data/data/db/eurolex.db"

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# fzf configuration
# complete -F _fzf_path_completion -o default -o bashdefault cd
