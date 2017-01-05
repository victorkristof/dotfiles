" Disable arrow keys in normal, visual and insert modes
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Ditch vi
set nocompatible

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>

" Search highlight
set hlsearch
" Disable highlight on space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Enable syntax highlighting
syntax enable

" Show line numbers
set number

" Show relative numbers (useful to see how far to jump to a line)
set relativenumber

" Set tabs to have 4 spaces
set ts=4

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab

" When using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" Show a visual line under the cursor's current line 
" Set cursorline

" Show the matching part of the pair for [] {} and ()
set showmatch

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Open splits right and below
set splitbelow
set splitright

" Remap ESC to combination that leaves your fingers on the home row
inoremap jk <ESC>

" Remap mapleader (Space instead of \)
let mapleader = "\<Space>"

" Visual autocomplete for command menu
set wildmenu 
