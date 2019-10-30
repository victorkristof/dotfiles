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
alias show="open -R"
# Define function to use the selected entry in fzf.
# alias f="fzf --height 100% --preview 'if file -i {}; then file -b {}; else bat --color=always {}; fi' --header 'ENTER to open file in Vim' --bind 'enter:execute(mvim -v {})+abort'"
# alias f="fzf --height 100% --preview 'bat --color=always {}' --header 'ENTER to open file in Vim' --bind 'enter:execute(_open {})+abort'"
alias f="_open"

# Virutalenv
alias activate="source venv/bin/activate"

# Jupyter Notebook
alias nb="jupyter notebook"
alias nbn="jupyter notebook --no-browser"

# Git
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdt="git difftool"
alias gu="git unstage"

function _preview {
    # Preserve trailing white spaces to detect code from `git status --short`.
    file="$@"
    # List files if it's a directory.
    if [[ -d $file ]]; then
        CLICOLOR_FORCE=1 ll $file
    # Display information if it's a binary file.
    elif [ $(file --mime $file | grep binary) ]; then
        ls -ho $file
        file -b $file
    # Otherwise preview them with bat.
    else
        bat --color=always $file
    fi
}
# Make it accessible to fzf preview.
export -f _preview

function _open {
    local files
    files=($(fzf --height 100% --preview '_preview {}' --header 'ENTER to open file or directory'))
    # If no files selected, do nothing.
    [ ${#files[@]} -eq 0 ] && return
    # If more than one files, open them in Vim.
    if [ ${#files[@]} -gt 1 ]; then
        mvim -v "${files[@]}"
    # Otherwise get the file.
    else
        file="${files[@]}"
        # If it's a directory.
        if [[ -d $file ]]; then
            # Change to directory.
            # echo $file
            cd $file
        # If it's a binary file.
        elif [ "$(file --mime $file | grep binary)" ]; then
            open $file
        # Otherwise open in Vim.
        else
            mvim -v $file
        fi
    fi
}
export -f _open

# Define preview function for git.
function _preview_git {
    # Preserve trailing white spaces to detect code from `git status --short`.
    IFS=
    code=$(echo "$@" | cut -c 1-2)
    file=$(echo "$@" | cut -c 4-)
    # Run diff on unstaged modified files.
    if [ $code = " M" ]; then
        git diff --color=always $file
    # Run diff on staged files.
    elif [ $code = "M " ]; then
        git diff --staged --color=always $file
    # List files if it's a directory.
    elif [[ -d $file ]]; then
        CLICOLOR_FORCE=1 ll $file
    # Display information if it's a binary file.
    elif [ $(file --mime $file | grep binary) ]; then
        ls -ho $file
        file -b $file
    # Otherwise preview them with bat.
    else
        bat --color=always $file
    fi
}
# Make it accessible to fzf preview.
export -f _preview_git

# Display status in fzf.
function s {

    # Set header.
    local header="$(git status | head -2)"
    header+=$'\nENTER to open in Vim, CTRL-A to stage, CTRL-U to unstage, CTRL-D to diff'
    local files=($(git -c color.status=always status --short \
      | fzf --no-sort --reverse \
      --ansi \
      --height 100% \
      --multi \
      --preview="_preview_git {}" \
      --preview-window=right:60%:wrap \
      --header="$header" \
      --bind "ctrl-a:execute(git add {+2} && echo 'ADD')+abort" \
      --bind "ctrl-u:execute(git reset -- {+2} > /dev/null 2>&1 && echo 'UNSTAGE')+abort" \
      --bind "ctrl-d:execute(echo {+2} | xargs -o git difftool)"
    ))

    # If no files selected, do nothing.
    [ ${#files[@]} -eq 0 ] && return
    # If add or unstage, print git status.
    if [ "$(echo ${files[@]})" = "ADD" ] || [ "$(echo ${files[@]})" = "UNSTAGE" ]; then
        git status && return
    fi
    # If more than one files, open them in Vim (if they exist).
    if [ ${#files[@]} -gt 0 ]; then
        # Each file comes with "XY filename", where XY is a git status code.
        # The for loop extract the filename (odd numbers) and passes it to xargs.
        for (( i=1; i<=${#files[@]}; i+=2 )); do if [ -f ${files[$i]} ]; then echo "${files[$i]}"; fi; done | xargs -o mvim -v
    fi
}
# Try some of the shortcuts here (for fish shel, so needs to adapt).
# function gbr --description "Git browse commits"
#     set -l log_line_to_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
#     set -l view_commit "$log_line_to_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R'"
#     set -l copy_commit_hash "$log_line_to_hash | xclip"
#     set -l git_checkout "$log_line_to_hash | xargs -I % sh -c 'git checkout %'"
#     set -l open_cmd "open"

#     if test (uname) = Linux
#         set open_cmd "xdg-open"
#     end

#     set github_open "$log_line_to_hash | xargs -I % sh -c '$open_cmd https://github.\$(git config remote.origin.url | cut -f2 -d. | tr \':\' /)/commit/%'"

#     git log --color=always --format='%C(auto)%h%d %s %C(green)%C(bold)%cr% C(blue)%an' | \
#         fzf --no-sort --reverse --tiebreak=index --no-multi --ansi \
#             --preview="$view_commit" \
#             --header="ENTER to view, CTRL-Y to copy hash, CTRL-O to open on GitHub, CTRL-X to checkout, CTRL-C to exit" \
#             --bind "enter:execute:$view_commit" \
#             --bind "ctrl-y:execute:$copy_commit_hash" \
#             --bind "ctrl-x:execute:$git_checkout" \
#             --bind "ctrl-o:execute:$github_open"
# end
# Browse log using fzf.
function gl {

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
   --preview-window=right:60%:wrap
  )

  # Pipe them.
  "${gitlog[@]}" | "${fzf[@]}"
}

# Use `v file` to either open the file if fzf finds one file
# or open fzf if there are more files. Use it without arguments
# to start fzf.
function v {
    local query="$@"
    if [ $# -eq 0 ]; then
        local files=($(fd --type file --hidden --follow --exclude .git --exclude *.ipynb | fzf --multi))
    else
        local files=($(fd --type file --hidden --follow --exclude .git --exclude *.ipynb | fzf --query="$query" --multi --select-1 --exit-0))
    fi
    [[ -n "$files" ]] && mvim -v "${files[@]}"
}

# Same as `v` but uses `open`.
function o {
    local query="$@"
    local files=($(fzf --query="$query" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && open "${files[@]}"
}

# Use `c keywods` to change directory to keyworkds using fzf.
function c {
    local query="$@"
    if [ $# -eq 0 ]; then
        local dir=$(fd --type d --hidden --exclude .git 2> /dev/null | fzf --query="$query" +m)
    else
        local dir=$(fd --type d --hidden --exclude .git 2> /dev/null | fzf --query="$query" +m --select-1 --exit-0)
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
