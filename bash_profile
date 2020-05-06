# Source .bashrc to load config from distant login
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Load Zettelkasten config.
if [ -f ~/.zettelkasten_config ]; then
   source ~/.zettelkasten_config
fi

# User install (Homebrew) program have priority
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set URL for databases
# export SOCCERWAY_DB_URL="sqlite:////Users/kristof/GitHub/kickoff.ai/kickoff-sci/data/sw-with-clubs-2018-05-18.db"
export SOCCERWAY_DB_URL="sqlite:////Users/kristof/GitHub/kickoff.ai/kickoff-sci/data/soccerway-2018-04-23-v2.db"
export PARL_DB="sqlite:////Users/kristof/GitHub/parl/data/data/db/parl-7.db"
export EUROLEX_DB="sqlite:////Users/kristof/GitHub/parl/data/data/db/eurolex-8.db"
export PREDIKON_DB="/Users/kristof/GitHub/predikon/v2/data/db/predikon.db"
export PREDIKON_RAGNOR_DB="/Users/kristof/GitHub/predikon/v2/data/db/predikon-ragnor.db"

# Indy web.
export INDY_ROOT="/Users/kristof/GitHub/indy-web/webapp/"

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Bat config file
export BAT_CONFIG_PATH="/Users/kristof/.batrc"

# fzf
export FZF_DEFAULT_COMMAND="fd --follow --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_DEFAULT_OPTS="--height 20% --border --layout=reverse --inline-info "
# FZF_DEFAULT_OPTS="--height 20% --border --layout=reverse --inline-info --preview='bat --color=always {}' "
# fzf colors:
# - fg      Text
# - bg      Background
# - hl      Highlighted substrings
# - fg+     Text (current line)
# - bg+     Background (current line)
# - gutter  Gutter on the left (defaults to bg+)
# - hl+     Highlighted substrings (current line)
# - info    Info
# - border  Border of the preview window and horizontal separators (--border)
# - prompt  Prompt
# - pointer Pointer to the current line
# - marker  Multi-select marker
# - spinner Streaming input indicator
# - header  Header
FZF_DEFAULT_OPTS+="--color=light,bg+:7,fg+:11,hl:5,hl+:5,info:4,border:11,prompt:11,pointer:5,marker:5,spinner:4,header:4 "
FZF_DEFAULT_OPTS+="--bind=?:toggle-preview "
FZF_DEFAULT_OPTS+="--bind=ctrl-e:preview-down "
FZF_DEFAULT_OPTS+="--bind=ctrl-y:preview-up "
FZF_DEFAULT_OPTS+="--bind=ctrl-f:preview-page-down "
FZF_DEFAULT_OPTS+="--bind=ctrl-b:preview-page-up "
FZF_DEFAULT_OPTS+="--bind=ctrl-g:abort "
FZF_DEFAULT_OPTS+="--bind=ctrl-k:kill-line "
FZF_DEFAULT_OPTS+="--bind 'ctrl-v:execute(mvim -v {})+abort' "
FZF_DEFAULT_OPTS+="--bind 'ctrl-o:execute(open {})+abort' "
FZF_DEFAULT_OPTS+="--bind 'ctrl-c:execute(cd {})+abort' "
FZF_DEFAULT_OPTS+="--bind 'ctrl-r:execute(open -R {})+abort' "
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"

# Editor
export EDITOR="mvim -v"

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Set man to use bat for page coloring.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kristof/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kristof/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kristof/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kristof/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Bash completion.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
