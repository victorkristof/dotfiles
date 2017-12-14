# Source .bashrc to load config from distant login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# User install (Homebrew) program have priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add access to utils everywhere
export PYTHONPATH=$PYTHONPATH:$HOME/GitHub/utils

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# fzf configuration
# complete -F _fzf_path_completion -o default -o bashdefault cd
