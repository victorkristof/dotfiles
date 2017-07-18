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
Plug 'romainl/flattened'
" Delete buffers as it should be done
Plug 'moll/vim-bbye'
" Combine with netrw to create a delicious salad dressing
" Plug 'tpope/vim-vinegar'
" Extends behaviour for f, t, F, and T keys
Plug 'rhysd/clever-f.vim'
" Enable repeating of some actions
Plug 'tpope/vim-repeat'
" Add git signs in the left column
Plug 'airblade/vim-gitgutter'
" Git wrapper so awesome it should be illegal
Plug 'tpope/vim-fugitive'
" Surroundings made simple
Plug 'tpope/vim-surround'
" No-BS Python code folding
Plug 'tmhedberg/simpylfold'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Status bar that is light as air
Plug 'bling/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'
" To work with virtualenv
Plug 'jmcantrell/vim-virtualenv'
" Intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" Autocompletion for Python
Plug 'davidhalter/jedi-vim'
" Performs completion with tab
Plug 'ervandew/supertab'
" Pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc'
" Pandoc's Markdown syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
" Pandoc integration with third-party plugins
Plug 'vim-pandoc/vim-pandoc-after'
" Modern plugin to edit LaTeX files
Plug 'lervag/vimtex'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Simple tmux status line generator
Plug 'edkolev/tmuxline.vim'

" Initialize plugin system
call plug#end()

" }}}
" MISC {{{

set nocompatible            " Ditch vi
" filetype indent on          " Load filetype-specific indent files
filetype plugin on          " Load fileypte-specific plugins
set nobackup                " Disable backup, git can do this work
set noswapfile              " Disable .swp files
" Invert ; and :
nnoremap : ;
nnoremap ; :
xnoremap : ;
xnoremap ; :
" jk is <Esc>
inoremap jk <ESC>
" Save the buffer
nnoremap <C-s> :w<CR>
" Close the buffer
nnoremap <C-q> :q<CR>
" Leave Ex mode for good
nnoremap Q <Nop>
" Y behaves like C and D
nnoremap Y y$

" }}}

" }}}
" COLORS {{{

syntax on                   " Enable syntax highlighting
set background=light        " Use light theme
" colorscheme solarized       " Eyes-friendly colorscheme
colorscheme flattened_light

" }}}
" SPACES AND TABS {{{

set tabstop=4               " Number of spaces per tab
set softtabstop=4           " Number of spaces in tab when editing
set expandtab               " Tab are spaces
set autoindent              " Indent when moving to the next line while writing
set shiftwidth=4            " Indent lines by 4 spaces
" Make backspaces more powerfull
set backspace=indent,eol,start
" Add blank line above cursor
nnoremap J o<ESC>k
" Add blank line below cursor
nnoremap K O<ESC>j

" }}}
" UI CONFIG {{{

set encoding=utf-8          " Set utf-8 compatible
set number                  " Show line numbers
set relativenumber          " Enable relative numbers
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
set lazyredraw              " Redraw only when needed (faster macros)
set ttyfast                 " Faster redraw
set mouse=a                 " Enable the mouse
set splitbelow              " Open split below
set splitright              " Open split right
set laststatus=2            " Always display status line
set wrap linebreak nolist   " Soft wrap text longer than window width
set showbreak=↪             " Better line wraps
" Set default font in GUI
set guifont=Menlo\ for\ Powerline:h14
" Cursor blinks only in insert mode
set guicursor+=n-v-c:blinkon0
" Display a vertical line at width 80 and 120
set colorcolumn=80
" Set color of line number background
" Informative status line
" set statusline=%F%m%r%h%w\ [%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
" Disable cursor blinking in macvim
set guicursor+=n-v-c:blinkon0
highlight CursorLineNr ctermbg=7  guibg=#eee8d5
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
set infercase               " Infer case for completion
set gdefault                " Substitute all occurrences by default
" Turn off search highlight
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" Replace visual selection
vnoremap <Leader>r y:%s/<C-r>=escape(@",'\$')<CR>/

" }}}
" SPELLING {{{

nnoremap <Leader>f 1z=      " Fix spelling error

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

" Format text (automatically according to textwidth)
set formatoptions=tqwan1j
" Format a paragraph according to the text width
nnoremap gQ m`gqap``
" Format till the end of the paragraph
nnoremap g} gq}<C-o>
" Join all line inside a paragraph
nnoremap gJ m`vipJ``
" Format in visual mode
vnoremap Q gq

" }}}
" FILES AND BUFFERS {{{

" Set default directory to GitHub
cd ~/GitHub/
" Automatically change directory when editing a file
" set autochdir
" Visual autocomplete for command menu
set wildmenu
" Configure menu
" set wildmode=list:full
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pkl,*.npy,*.spy
set wildignore+=*.pdf,*.psd
" Start :e **/*
nnoremap <Leader>e :e **/*
" Set ctrl-z as trigger to autocompletion in macros
set wildcharm=<C-z>
" List buffers and open prompt
" nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>b :buffer **/*
" List buffers and open prompt, enter will open in split
nnoremap <leader>B :vert :sbuffer <C-z><S-Tab>
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" }}}
" WINDOWS {{{

" Windows are automatically made the same size
set equalalways
" Increase height of window
nnoremap <C-=> <C-w>+
" Decrease height of window
nnoremap <C--> <C-w>-
" Increase width of window
nnoremap <C-.> <C-w>>
" Decrease width of window
nnoremap <C-,> <C-w><

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
" Move vertically by visual line
" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist and center screen.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" Highlight last inserted text
nnoremap gV `[v`]
" Facilitate navigation between buffers
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" Move to next/previous window with Tab and Backspace
nnoremap <Tab> <C-w>w
nnoremap <BS> <C-w>W

" }}}
" {{{ INSERT MODE

" Go to end of line
inoremap AA <C-[>A
" Go to beginning of line
inoremap II <C-[>I
" Start new line
inoremap OO <C-[>o
" Add = at the end of line
" inoremap == <C-[>A<Space>=<Space>
" Add ( at the end of line
inoremap (( <C-[>I(
" Add ) at the end of line
inoremap )) <C-[>A)<Space>
" Add : at the end of line
inoremap :: <C-[>A:<Space>
" Complete line
inoremap <C-l> <C-x><C-l>
" Insert current day
inoremap <C-d> <C-r>=strftime('%d-%m-%Y')<CR>
" Put yank register
inoremap <C-p> <C-r>"

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
let maplocalleader='\'      " Local leader is backslash
" Edit vimrc in new tab
nnoremap <Leader>vc :tabe ~/.dotfiles/.vimrc<CR>
" Source vimrc
nnoremap <Leader>sc :source ~/.vimrc<CR>

" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>
" Visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv

"}}}
" CLEVER-F {{{

" F always serach backwards, f always search forward
let g:clever_f_fix_key_direction = 1
" Search only on cursor line
let g:clever_f_across_no_line = 1
" Smart case (fa searches for a and A, fA seraches only for A)
let g:clever_f_smart_case = 1

" }}}
" SUPERTAB {{{

" Supertab tries to infer what to complete
let g:SuperTabDefaultCompletionType = "context"
" Should work with omnifunc and omnicompletefunc functions
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery =
"     \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"}}}
" NETRW {{{

" Open Netrw
nnoremap <Leader>t :Lexplore<CR>
" Tree is default view
let g:netrw_liststyle = 3
" Explore window takes 20% of available space
let g:netrw_winsize = 20
" Remove the banner
let g:netrw_banner = 0
" Open in previous window
let g:netrw_browse_split = 4
" Open the split on the right and keep the tree on the left
let g:netrw_altv = 1

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

" augroup NetrwGroup
"   autocmd! BufEnter * call NormalizeWidths()
" augroup END

" }}}
" BBYE {{{

" Shortcut to close buffers
nnoremap <Leader>q :Bdelete<CR>

" }}}
" GIT-GUTTER {{{

set updatetime=250              " Update signs quicker
" Remap hunk movements
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" Remap hunk text-objects
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
" Remap hunk stage and revert
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
" Remap preview hunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
" Toggle line highlights
nmap <Leader>ht :GitGutterLineHighlightsToggle<CR>

" }}}
" FUGITIVE {{{

" Shortcut to Gstatus
nnoremap <Leader>gs :Gstatus<CR>
" Shortcupt to Gcommit
nnoremap <Leader>gc :Gcommit<CR>
" Shortcut to Gpush
nnoremap <Leader>gp :Gpush<CR>
" Shortcut for Gpull
nnoremap <Leader>gl :Gpull<CR>
" Shortcut for Gwrite
nnoremap <Leader>gw :Gwrite<CR>

" }}}
" SIMPYLFOLD {{{

" Do not fold doc string
let g:SimpylFold_fold_docstring = 0
" Enable preview of docstring
let g:SimpylFold_docstring_preview = 1
" Do not fold imports
let g:SimpylFold_fold_import = 0
" Fix a bug in certain cases
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

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
let g:airline#extensions#wordcount#filetypes = '\(pandoc|markdown\)'
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
" NERDCOMMENTER {{{

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comments left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" }}}
" SYNTASTIC {{{

" Syntastic recommended settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Set the height of the location list
let g:syntastic_loc_list_height = 5

" }}}
" JEDI {{{

" Use tabs instead of buffers when going to definition
let g:jedi#use_tabs_not_buffers = 1
" Map go to definition command
let g:jedi#documentation_command = "<Localleader>d"
" Show all usages of element under cursor
let g:jedi#usages_command = "<Localleader>n"
" Disable goto command, default: <leader>d
let g:jedi#goto_command = "<Localleader>g"
" Disable goto assignments, default: <leader>g
let g:jedi#goto_assignments_command = ""
let g:jedi#rename_command = "<Localleader>r"

" }}}
" PANDOC {{{

" Disable fold column
let g:pandoc#folding#fdc = 0
" Blacklist some conceals
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
" Change header conceal style
" let g:pandoc#syntax#conceal#cchar_overrides = {"atx" : "#"}
" Remove background from conceals
highlight Conceal cterm=NONE ctermbg=NONE ctermfg=4 guibg=NONE guifg=#268bd2 gui=NONE

" }}}
" MARKDOWN {{{

augroup markdown
    autocmd!
    " Remove 80 chars delimiter
    autocmd FileType markdown setlocal colorcolumn=
    autocmd FileType markdown setlocal foldlevel=1
    autocmd FileType markdown highlight OverLengthHard NONE
    autocmd FileType markdown highlight OverLengthSoft NONE
    " Render marked elements inline
    " autocmd FileType markdown set conceallevel=2
augroup END

" Highlight JSON
" let g:vim_markdown_json_frontmatter = 1

" }}}
" LATEX {{{

" Enable folding
let g:vimtex_fold_enabled=1
" Default .tex files to tex format
let g:tex_flavor = 'latex'
" Diable some warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \}
" Automatically close brackets
let g:vimtex_complete_close_braces = 1

augroup latex
    autocmd!
    " Number of spaces per tab
    autocmd FileType tex setlocal tabstop=2
    " Number of spaces in tab when editing
    autocmd FileType tex setlocal softtabstop=2
    " Indent lines by 4 spaces
    autocmd FileType tex setlocal shiftwidth=2
    " Conceal level set to 2
    autocmd FileType tex setlocal conceallevel=2
    " Enable autoformat and paragraph stop on line break (useful for equation)
    autocmd FileType tex setlocal fo+=wa
augroup END

" }}}
" AUTOCOMMANDS {{{

" Wrapped in augroup to ensure autocmd are applied only once
augroup configgroup
    " Clear all autocmd for the current group
    autocmd!
    " Remove all useless white spaces
    autocmd BufWritePre *.py,*.php,*.md,*.txt,*.tex,.bib :call StripTrailingWhitespaces()
    autocmd FileType vim :call StripTrailingWhitespaces()
    " Set comment pattern for Python files
    autocmd FileType python setlocal commentstring=#\ %s
    " Automatically sources changes in vimrc when file is saved
    " autocmd BufWritePost .vimrc,vimrc source % | AirlineRefresh | redraw
    " Enable full highlighting for Python files
    " autocmd BufRead,BufNewFile *.py let python_highlight_all=1
    " Spell checks Git commits
    autocmd FileType gitcommit setlocal spell
    " Spell checks textfiles
    autocmd BufRead,BufNewFile *.txt,*.md,*.tex setlocal spell
    " Automatically equalise splits when Vim is resised
    autocmd VimResized * wincmd =
augroup END

" }}}
" CUSTOM FUNCTIONS {{{

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
