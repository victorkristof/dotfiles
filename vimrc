" Disable arrow keys in normal and insert modes
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" ditch vi
set nocompatible

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>

" search highlight
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" enable syntax highlighting
syntax enable

" show line numbers
set number

" show relative numbers (useful to see how far to jump to a line)
set relativenumber

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line 
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" open splits right and below
set splitbelow
set splitright

" remap ESC to combination that leaves your fingers on the home row
inoremap jk <ESC>

" remap mapleader (Space instead of \)
let mapleader = "\<Space>"

" visual autocomplete for command menu
set wildmenu 
