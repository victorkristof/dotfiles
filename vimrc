" Victor Kristof

" VIM-PLUG {{{

" Initialise VimPlug (https://github.com/junegunn/vim-plug)
" You can specify a directory for plugins (.vim/plugged/ by default)
call plug#begin()

" Plugins come here - make sure you use single quotes

" Using % will match more than one character
Plug 'vim-scripts/matchit.zip'
" Solarized for vim
Plug 'altercation/vim-colors-solarized'
" Delete buffers as it should be done
Plug 'moll/vim-bbye'
" Extended f, F, t and T key mappings for Vim.
Plug 'rhysd/clever-f.vim'
" Enable repeating of some actions
Plug 'tpope/vim-repeat'
" Add git signs in the left column
Plug 'airblade/vim-gitgutter'
" Surroundings made simple
Plug 'tpope/vim-surround'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Status bar that is light as air
Plug 'bling/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'
" To work with virtualenv
Plug 'jmcantrell/vim-virtualenv'
" Comment stuff out
Plug 'tpope/vim-commentary'
" Python syntax highlighting
Plug 'vim-python/python-syntax'
" Python indent style complying with PEP8
Plug 'hynek/vim-python-pep8-indent'
" Python syntax checking
Plug 'nvie/vim-flake8'
" Light-weight tab-completion
Plug 'ajh17/vimcompletesme'
" Markdown
Plug 'SidOfc/mkdx'
" Modern plugin to edit LaTeX files
Plug 'lervag/vimtex'
" Speed up updating folds
" Plug 'konfekt/fastfold'
" Look up words on online Thesaurus
" Plug 'ron89/thesaurus_query.vim'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Simple tmux status line generator
Plug 'edkolev/tmuxline.vim'
" MatchParen for HTML tags
Plug 'gregsexton/matchtag'
" Ghetto HTML mappings
" Plug 'tpope/vim-ragtag'
" Filter and align texts
Plug 'godlygeek/tabular'
" Create your own text objects
Plug 'kana/vim-textobj-user'
" Text object for HTML attributes
Plug 'victorkristof/vim-textobj-xmlattr'
" Text object for comment
Plug 'glts/vim-textobj-comment'
" Text object for key-value
Plug 'vimtaku/vim-textobj-keyvalue'
" Text object for parameters (including swapping and movements)
Plug 'andrewradev/sideways.vim'
" Restore focus event
Plug 'tmux-plugins/vim-tmux-focus-events'
" The ultimate snippets solution for Vim.
Plug 'sirver/ultisnips'
" Fuzzy-finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Easily search for, substitute, and abbreviate multiple variants of a word.
" Plug 'tpope/vim-abolish'
" A very simple plugin that makes hlsearch more useful.
Plug 'romainl/vim-cool'
" Readline-style insertion.
Plug 'tpope/vim-rsi'

" Initialize plugin system
call plug#end()

" }}}
" MISC {{{

set nocompatible            " Ditch vi
set hidden                  " Allows to switch buffer when modified
filetype plugin on          " Load fileypte-specific plugins
set nobackup                " Disable backup, git can do this work
set noswapfile              " Disable .swp files
set undofile                " Enable persistent undo history
set undodir=~/.vim/undo/,.
" Remap ; to :
nnoremap ; :
xnoremap ; :
nnoremap é :
xnoremap é :
" Repeat last edit n times
nnoremap . :<C-u>execute "norm! " . repeat(".", v:count1)<CR>
" Fix delay when exiting visual and command mode with <ESC>
set ttimeoutlen=1
" jk is <Esc>
inoremap jk <ESC>
" Replace Ex mode by formatting (as in Vim 5.0). Ex mode is accessed via gQ
nnoremap Q gq
" Y behaves like C and D
nnoremap Y y$
" In visual mode, $ reaches end of line without the line break.
vnoremap $ $h

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
let maplocalleader='\'      " Local leader is backslash
" Edit vimrc in new tab
nnoremap <Leader>vc :tabe ~/.vim/vimrc<CR>
" Source vimrc and reload current buffer, syntax is lost otherwise
nnoremap <Leader>sc :source ~/.vim/vimrc<CR>:e<CR>
" Paste from clipboard
nnoremap <Leader>p :r !pbpaste<CR>
" Make
nnoremap <Leader>mk :!make<CR>
" }}}
" JOURNAL {{{

" Bring up journal (with capital if problems with mark)
nnoremap <leader>J :tabe ~/Documents/research/journal.md<CR>
nnoremap <leader>j :tabnew<CR>`J
" Bring up reading list
nnoremap <leader><leader>R :tabe ~/Documents/research/reading-list.md<CR>
nnoremap <leader><leader>r :tabnew<CR>`R
" Bring up ideas file
nnoremap <leader><leader>i :tabe ~/Documents/research/ideas.md<CR>
" nnoremap <CR>i :tabnew<CR>`I
" Bring up snippets
nnoremap <leader><leader>S :tabe ~/Documents/research/snippets.md<CR>
nnoremap <leader><leader>s :tabnew<CR>`S
" Bring up learn file
nnoremap <leader><leader>L :tabe ~/Documents/research/learn.md<CR>
nnoremap <leader><leader>l :tabnew<CR>`L
" Bring up blog file
nnoremap <leader><leader>B :tabe ~/Documents/research/blog.md<CR>
nnoremap <leader><leader>b :tabnew<CR>`B

augroup specialfiles
    autocmd!
    " Add new entry
    autocmd BufRead journal.md nnoremap <buffer> <Localleader>ne ggji<CR><CR><Up>## [<C-r>=strftime('%d-%m-%Y')<CR>]<Space>
    " Set mark when leaving files
    autocmd BufLeave journal.md :normal mJ
    autocmd BufLeave reading-list.md :normal mR
    autocmd BufLeave ideas.md :normal mI
    autocmd BufLeave snippets.md :normal mS
    autocmd BufLeave learn.md :normal mL
    autocmd BufLeave blog.md :normal mB
    " Check document in the list: transfer it to the 'Read' section with " date
    " Add a mark in 'r' register at '## Read' line
    autocmd BufRead reading-list.md :call setpos("'r", [0, search("## Read"), 0, 0])
    autocmd BufRead reading-list.md nnoremap <buffer> <C-x> m'dd'rjp0lli<C-r>=strftime('%d-%m-%Y')<CR>: <C-[>''
    " Add new link to list
    autocmd BufRead reading-list.md nnoremap <buffer> <Localleader>nl o- [](<C-r>*)<C-[>03li
augroup end

" }}}
" ZETTELKASTEN {{{

" Set template for new notes.
" let g:zettel_template = [{"template" : "~/Documents/zettelkasten/template.tpl"}]

" Set filename
" let g:zettel_format = "%Y%m%d%H%M"

augroup zettelkasten
    autocmd!
    " Add source link (assume the link is copied in the pasteboard).
    autocmd BufRead */zettelkasten/reference-notes/* nnoremap <buffer> <Localleader>ns gg:call search("Source:")<CR>A <C-R>*
    autocmd BufRead */zettelkasten/slip-box/* nnoremap <buffer> <Localleader>nr gg:call search("References:")<CR>o<Tab>-
    autocmd BufRead */zettelkasten/* nnoremap <buffer> <Localleader>nt gg:call search("Tags:")<CR>A #
    " Highlight tags.
    autocmd BufRead */zettelkasten/* syn match ZettelkastenTags '#[a-zA-Z0-9-]\+\ze'
    autocmd BufRead */zettelkasten/* hi ZettelkastenTags cterm=bold ctermfg=4 gui=bold guifg=Blue
    " Highlight header.
    autocmd BufRead */zettelkasten/* syn match ZettelkastenHeader '\v^(Date|Tags|References|Source):'
    autocmd BufRead */zettelkasten/* hi ZettelkastenHeader cterm=bold gui=bold
    " Set path to make gf and search from both Zettelkasten systems.
    autocmd BufRead */zettelkasten/* setlocal path+=/Users/kristof/Documents/zettelkasten/**
    autocmd BufRead */zettelkasten/* setlocal path+=/Users/victor/Documents/zettelkasten/**
    " Set filetype for zettelkasten config.
    autocmd BufRead .zettelkastenrc setlocal filetype=bash
augroup end

" }}}
" COLORS {{{

syntax on                   " Enable syntax highlighting
set background=light        " Use light theme
colorscheme solarized       " Eyes-friendly colorscheme

" }}}
" SPACES AND TABS {{{

set tabstop=4               " Number of spaces per tab
set shiftwidth=4            " Indent lines by 4 spaces
set softtabstop=4           " Number of spaces in tab when editing
set expandtab               " Tab are spaces
set autoindent              " Indent when moving to the next line while writing
" Make backspaces more powerful
set backspace=indent,eol,start
" Add blank line above cursor
" nnoremap J o<ESC>k
" Add blank line below cursor
" nnoremap K O<ESC>j
" Add one space on the left side of the cursor.
" nnoremap H i <ESC>l
" Add one space on the right side of the cursor.
" nnoremap L a <ESC>h

" }}}
" UI CONFIG {{{

set encoding=utf-8          " Set utf-8 compatible
set number                  " Show line numbers
set relativenumber          " Enable relative numbers
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
set visualbell              " Visual error
set lazyredraw              " Redraw only when needed (faster macros)
set ttyfast                 " Faster redraw
set mouse=a                 " Enable the mouse
set splitbelow              " Open split below
set splitright              " Open split right
set laststatus=2            " Always display status line
set wrap linebreak          " Soft wrap text longer than window width
set showbreak=↪             " Better line wraps
set scrolloff=2             " Gives 2 lines of context above and bellow cursor
set nolist                  " Show invisible characters
" Show characters with set list
set listchars=tab:▸\ ,eol:¬,space:•,nbsp:~

" Set default font in GUI
" To install: brew cask install font-sourcecodepro-nerd-font-mono
" set guifont=Menlo\ for\ Powerline:h14
set guifont=SauceCodePro\ Nerd\ Font:h14

" Set background of cursor line number to be the same as column
highlight CursorLineNr cterm=bold ctermbg=7 guibg=#eee8d5
" Set background of gutter to the same color as column
highlight Error ctermbg=7 ctermfg=1 guibg=#eee8d5
highlight WarningMsg ctermbg=7 ctermfg=3 guibg=#eee8d5

" Change cursor shape on different mode
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Underline in replace mode
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" }}}
" SEARCHING {{{

set incsearch               " Search as you type
set hlsearch                " Highlight matches
set ignorecase              " Ignore case by default
set smartcase               " Smart case: search with upper case
set infercase               " Infer case for completion
set gdefault                " Substitute all occurrences by default
" Turn off search highlight
nnoremap <silent> <BS> :nohlsearch<CR>
" Replace visual selection
vnoremap <Leader>r y:%s/\(<C-r>=escape(@",'\$')<CR>\)/
" Search for selected term
vnoremap / y/<C-r>"<CR>N
" Show number of matches in the command-line (vim-cool plugin)
let g:CoolTotalMatches = 1

" }}}
" SPELLING {{{

" Turnon French spelllang.
nnoremap <Leader>sfr :set spelllang=fr<CR>
" Turnon English spelllang.
nnoremap <Leader>sen :set spelllang=en<CR>
" Fix spelling error
nnoremap <Leader>ff 1z=
" Fix previous spelling error and come back to position
nnoremap <Leader>fp [s1z=<C-o>
" Fix next spelling error and come back to position
nnoremap <Leader>fn ]s1z=<C-o>
" Fix last spelling error from insert mode
" inoremap <C-f> <C-[>[s1z=<C-o>a
inoremap <C-z> <C-g>u<Esc>[s1z=`]a<C-g>u
" Set Thesaurus file in English
" Source: https://github.com/vim/vim/issues/629#issuecomment-443293282
set thesaurus=~/.vim/thesaurus/english.txt

" }}}
" FOLDING {{{

set foldenable              " Enable folds
nnoremap <Space> za
" Space creates folds in visual mode
vnoremap <Space> zf
" Toggles all folds in file
nnoremap - :call ToggleAllFolds()<CR>:echo<CR>
" Remove underline in cterm and bold in gui
highlight Folded cterm=bold gui=bold

" }}}
" FORMATTING {{{

" Color three columns after textwidth.
set colorcolumn=+1,+2,+3
" Format text (according to textwidth)
set formatoptions=cqn1j

" }}}
" FILES AND BUFFERS {{{

" Switch between alternate buffers (this is one of my killer mappings)
nnoremap <Tab> <C-^>
" Open the alternate buffer in a vertical split.
nnoremap <Leader><Tab> :vs #<CR>
" Command suggested in .vimrc_example to see the changes in a buffer since the
" file was loaded.
command! DiffOrig
        \ vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis
" Automatically reload files when changed from outside vim
set autoread
" Visual autocomplete for command menu
set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pkl,*.npy,*.spy
set wildignore+=*.pdf,*.psd
" Edit new file in current window
nnoremap <Leader>e :Files<CR>
" Edit new file in vertical split buffer
" nnoremap <leader>E :vs **/*
" Set ctrl-z as trigger to autocompletion in macros
" set wildcharm=<C-z>
" List buffers and open prompt
nnoremap <leader>b :Buffers<CR>
" List buffers and open prompt, enter will open in split
" nnoremap <leader>B :vert :sbuffer <C-z><S-Tab>

" }}}
" WINDOWS {{{

" Windows are automatically made the same size
set equalalways
" Close quickfix window.
nnoremap <C-q> :ccl<CR>

" }}}
" MOVEMENT {{{

" Disable arrow keys in normal, visual and insert modes
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist and center screen.
nnoremap <expr> j v:count ? (v:count >= 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count >= 5 ? "m'" . v:count : '') . 'k' : 'gk'

" }}}
" TEXT OBJECTS {{{

" Line text objects.
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>
" Argument text objects.
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI


" }}}
" {{{ INSERT MODE

" Go to end of line
inoremap AA <C-[>A
" Go to beginning of line
inoremap II <C-[>I
" Start new line
inoremap OO <C-[>o
" Break undo sequence before deleting until the end of the line.
inoremap <C-U> <C-G>u<C-U>
" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>
" Visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv

"}}}
" GREP {{{

" Set grep program.
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c:%m

"}}}
" COMPLETION {{{

" Start at the end of the completion menu, do not automatically complete.
set completeopt+=longest

" }}}
" SIDEWAYS {{{

" Mappings to swap arguments.
nnoremap <silent> g< :SidewaysLeft<cr>
nnoremap <silent> g> :SidewaysRight<cr>
" Mappings for argument movements.
nnoremap <silent> [a :SidewaysJumpLeft<cr>
nnoremap <silent> ]a :SidewaysJumpRight<cr>

" }}}
" CLEVER-F {{{

" Fix direction of search.
let g:clever_f_fix_key_direction = 1
" Search on current line only.
let g:clever_f_across_no_line = 1
" Clever case ('fa' matches 'a' and 'A')
let g:clever_f_smart_case = 1
" Set highlight color.
let g:clever_f_mark_char_color = "Search"
" Show characters to which you can jump.
let g:clever_f_mark_direct = 1
" Set color of characters to which you can jump.
let g:clever_f_mark_direct_color = "Search"

" }}}
" BBYE {{{

" Shortcut to close buffers
nnoremap <Leader>q :Bdelete<CR>

" }}}
" GIT-GUTTER {{{

" Update signs quicker, as recommended by plugin author
set updatetime=100
" Remap hunk movements
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" Match line number column background
highlight! link SignColumn LineNr

" }}}
" AIRLINE {{{

let g:airline_powerline_fonts = 1     " Enhanced symbols
let g:airline#extensions#tabline#enabled = 1 " Enables buffer list
let g:airline#extensions#tabline#tab_nr_type = 1 " Show tab number
let g:airline#extensions#tabline#show_close_button = 0 " Remove close button
let g:airline#extensions#branch#enabled = 1 " Show the branch name
let g:airline#extensions#hunks#enabled = 1 " Show summary of hunk changes
let g:airline#extensions#hunks#non_zero_only = 1 " Enable showing only non-zeros
let g:airline#extensions#virtualenv#enabled = 0 " Disable virtualenv
let g:airline#extensions#whitespace#enabled = 1 " Enable whitespace check
let g:airline#extensions#wordcount#enabled = 1  " Enable word count
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org|text|asciidoc|tex|mail'
let g:airline#extensions#tmuxline#enabled = 0 " Disable as custom theme

" Setup airline
function! AirlineInit()
  let g:airline_section_b = airline#section#create_left(['%-0.25{getcwd()}'])
  " Add parenthesis around virtualenv name to match terminal display
  let g:virtualenv_stl_format = '(%n)'
  let g:airline_section_x = airline#section#create(
              \['tagbar', ' ', 'filetype', ' %{virtualenv#statusline()}'])
  let g:airline_section_y = airline#section#create(['hunks', 'branch'])
  " Remove ugly L/N symbol
  let g:airline_symbols.maxlinenr = ''
  let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ' %3p%%'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" }}}
" FLAKE8 {{{

" NOTE: requires flake8 package => pip install flake8
" No :h documentation, check on github: https://github.com/nvie/vim-flake8

" Show signs
let g:flake8_show_in_gutter=1
" Configure signs
let g:flake8_pyflake_marker=''
let g:flake8_error_marker=''
let g:flake8_warning_marker=''
let g:flake8_complexity_marker=''
let g:flake8_naming_marker=''

" Use colors defined in the colorscheme
highlight link Flake8_PyFlake    Error
highlight link Flake8_Error      WarningMsg
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg

augroup flake8
    autocmd!
    " Run flake8 on save
    autocmd BufWritePost *.py call Flake8()
augroup END

" }}}
" PYTHON {{{

" Highlight all syntax
let g:python_highlight_all = 1
let g:python_highlight_operators = 0

augroup python
    autocmd!
    " Set 79 chars delimiter
    autocmd FileType python setlocal textwidth=79
    " Highlight functions in blue
    autocmd FileType python
        \ syn match pythonInlineFunction '[a-zA-Z_][a-zA-Z0-9_]*\ze('
        \ | hi def link pythonInlineFunction Function
    " Special types in bold orange
    autocmd FileType python hi pythonNone cterm=bold ctermfg=3 gui=bold guifg=#b58900
    autocmd FileType python hi pythonBoolean cterm=bold ctermfg=3 gui=bold guifg=#b58900
    " Keywords in bold
    autocmd FileType python hi pythonStatement cterm=bold ctermfg=2 gui=bold guifg=#859900
    autocmd FileType python hi pythonRepeat cterm=bold ctermfg=2 gui=bold guifg=#859900
    autocmd FileType python hi pythonConditional cterm=bold ctermfg=2 gui=bold guifg=#859900
    autocmd FileType python hi pythonException cterm=bold ctermfg=2 gui=bold guifg=#859900
    autocmd FileType python hi pythonOperator cterm=bold ctermfg=2 gui=bold guifg=#859900
    " Import in bold
    autocmd FileType python hi pythonImport cterm=bold ctermfg=9 gui=bold guifg=#cb4b16
    " Decorator in violet
    autocmd FileType python hi pythonDecorator ctermfg=13 guifg=#6c71c4
    autocmd FileType python hi pythonDottedName ctermfg=13 guifg=#6c71c4
    " Self and cls in violet and italics
    autocmd FileType python hi pythonClassVar ctermfg=13 guifg=#6c71c4 cterm=italic gui=italic
augroup END

" }}}
" MARKDOWN {{{

" Map prefix to localleader
let g:mkdx#map_prefix = '<localleader>'
" Strike with ~
" let g:mkdx#settings = { 'tokens': { 'strike': '~' } }
" Disable complete link to make VimCompletesMe work correctly.
let g:mkdx#settings = { 'links': { 'fragment': { 'complete': 0 } } }
" Remap inline code formattig
nmap <localleader>c <Plug>(mkdx-mapping-wrap-text-in-backticks)
vmap <localleader>c <Plug>(mkdx-mapping-wrap-text-in-backticks)
" Remap toggle quote
nmap <localleader>q <Plug>(mkdx-toggle-quote-n)
vmap <localleader>q <Plug>(mkdx-toggle-quote-v)
" Remap wrap text in link
nmap <localleader>nl <Plug>(mkdx-wrap-link-n)
vmap <localleader>nl <Plug>(mkdx-wrap-link-v)
" Remap checkbox ticking
nmap <localleader>x <Plug>(mkdx-checkbox-next)
vmap <localleader>x <Plug>(mkdx-checkbox-next)
nmap <localleader>X <Plug>(mkdx-checkbox-prev)
vmap <localleader>X <Plug>(mkdx-checkbox-prev)
" Remap italic
nmap <localleader>i <Plug>(mkdx-text-italic-n)
vmap <localleader>i <Plug>(mkdx-text-italic-v)

augroup markdown
    autocmd!
    " Abbreviations
    autocmd FileType markdown ab eg e.g.,
    autocmd FileType markdown ab ie i.e.,
    " Highlight Wiki-like URLs: [[path/or/url/...]]
    autocmd FileType markdown syn match markdownWikiURL '\[\[\zs[^]]\{-}\ze\]\]'
    autocmd FileType markdown hi link markdownWikiURL markdownUrl
augroup END

" }}}
" LATEX {{{

" Default .tex files to tex format
let g:tex_flavor = 'latex'
" Diable some warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \}

augroup latex
    autocmd!
    " Number of spaces per tab.
    autocmd FileType tex,bib setlocal tabstop=2
    " Number of spaces in tab when editing.
    autocmd FileType tex,bib setlocal softtabstop=2
    " Indent lines by 2 spaces.
    autocmd FileType tex,bib setlocal shiftwidth=2
    " Conceal level set to 0.
    autocmd FileType tex setlocal conceallevel=0
augroup END

" }}}
" HTML & CSS {{{

augroup html
    autocmd!
    " Disable column at 80 characters
    " autocmd FileType html,htmldjango setlocal colorcolumn=
    " Number of spaces per tab
    autocmd FileType html,htmldjango,css,scss setlocal tabstop=2
    " Number of spaces in tab when editing
    autocmd FileType html,htmldjango,css,scss setlocal softtabstop=2
    " Indent lines by 2 spaces
    autocmd FileType html,htmldjango,css,scss setlocal shiftwidth=2
augroup END

" }}}
" ULTISNIPS {{{


" Set expand trigger.
let g:UltiSnipsExpandTrigger = '<C-]>'
" Show snippets list.
let g:UltiSnipsListSnippets = '<C-l>'
" UtliSnipsEdit opens in vertical window.
let g:UltiSnipsEditSplit = 'vertical'
" Set directories.
let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/ultisnips', 'ultisnips']

" }}}
" TMUXLINE {{{

" Configure tmux statusline
" Add the status text (charing, discharging, charged)
" \, '#(pmset -g batt | grep -Eo "(charging|charged|discharging)")'],
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#F', '#W'],
      \'cwin' : ['#F', '#W'],
      \'y'    : '#(pmset -g batt | grep -Eo "(100|[0-9][0-9]|[0-9])%%")',
      \'z'    : '%a. %R',
      \'options' : {'status-justify' : 'left'}}

" }}}
" AUTOCOMMANDS {{{

" Wrapped in augroup to ensure autocmd are applied only once
augroup configgroup
    autocmd!
    " Remove all useless white spaces
    autocmd BufWritePre * :call StripTrailingWhitespaces()
    " Spell checks Git commits
    autocmd FileType gitcommit setlocal spell
    " Spell checks textfiles
    autocmd BufRead,BufNewFile *.txt,*.md,*.tex setlocal spell
    " Automatically equalise splits when Vim is resised
    autocmd VimResized * wincmd =
augroup END

" }}}
" CUSTOM FUNCTIONS {{{

function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)
   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction

" Strip trailing whitespaces.
" This is called on buffer write in the autogroup above.
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Toggles all folds in file
function! ToggleAllFolds()
    if(&foldlevel>0)
        set foldlevel=0
    else
        set foldlevel=99
    endif
endfunction

" }}}

" Configure .vimrc folding (works with modelines)
" vim:foldmethod=marker:foldlevel=0
