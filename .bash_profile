# Source .bashrc to load config from distant login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
