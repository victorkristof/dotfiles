# System
alias dd="cd /Users/kristof/Desktop"
alias rd="cd /Users/kristof/GitHub"
alias ..="cd .."
alias ll="ls -AGFhop"
alias llt="ls -AGFhoptr"
alias llg="ls -AGFhop | grep"
alias lsg="ls | grep"
alias l="ls -GFhlp"
alias cp="cp -i"
alias mv="mv -i"
alias env="env | sort | bat"
# Define function to use the selected entry in fzf.
alias f="fzf --height 100% --bind 'enter:execute(mvim -v {})+abort'"

# Virutalenv
alias activate="source venv/bin/activate"

# Jupyter Notebook
alias nb="jupyter notebook"
alias nbn="jupyter notebook --no-browser"

# Git
alias s="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdt="git difftool"
alias gl="git log"
alias gu="git unstage"

# Browse log using fzf.
function g() {

  # Param validation.
  if [[ ! `git log -n 1 $@ | head -n 1` ]] ;then
    return
  fi

  # Filter by file string.
  local filter
  # Git log for file if exists.
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  # Git command
  local gitlog=(
    git log
    --graph --color=always --abbrev=7
    --format='%C(yellow)%C(bold)%h%C(auto)%d %C(blue)%an %C(auto)%s %C(bold)%cr'
    $@
  )

  # Fzf command.
  local fzf=(
    fzf
    --height 100% --ansi --no-sort --reverse --tiebreak=index
    --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}"
    --bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | git show --color=always | less -R"
    # --bind "ctrl-m:execute:
    #             (grep -o '[a-f0-9]\{7\}' | head -1 |
    #             xargs -I % sh -c 'git show --color=always % $filter | less -R') << 'FZF-EOF'
    #             {}
    #             FZF-EOF"
   --preview-window=right:60%
  )

  # Pipe them.
  "${gitlog[@]}" | "${fzf[@]}"
}

# Use `v file` to either open the file if fzf finds one file
# or open fzf if there are more files. Use it without arguments
# to start fzf.
function v() {
    local query="$@"
    if [ $# -eq 0 ]; then
        local files=($(fd --type file --hidden --follow --exclude .git --exclude *.ipynb | fzf --query="$query" --multi --preview='bat --color=always {}'))
    else
        local files=($(fd --type file --hidden --follow --exclude .git --exclude *.ipynb | fzf --query="$query" --multi --select-1 --exit-0 --preview='bat --color=always {}'))
    fi
    [[ -n "$files" ]] && mvim -v "${files[@]}"
}

# Same as `v` but uses `open`.
function o() {
    local query="$@"
    local files=($(fzf --query="$query" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && open "${files[@]}"
}

# Use `c keywods` to change directory to keyworkds using fzf.
function c() {
    local query="$@"
    if [ $# -eq 0 ]; then
        local dir=$(fd --type d --hidden --exclude .git 2> /dev/null | fzf --query="$query" +m --preview='')
    else
        local dir=$(fd --type d --hidden --exclude .git 2> /dev/null | fzf --query="$query" +m --select-1 --exit-0 --preview='')
    fi
    cd "$dir"
}

# Change to directory of file.
cdf() {
   local file
   local dir
    local query="$@"
   file=$(fzf +m -q "$query") && dir=$(dirname "$file") && cd "$dir"
}

# Platform-dependent aliases
if [ "$(uname)" == "Darwin" ]; then
    # macOS
    alias vim="mvim -v"
    alias vv="mvim -v"
    alias rm="trash"
    alias j="vim ~/Documents/research/journal.md"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    alias v="vim"
    alias ls='ls --color=auto'
fi
