" Victor Kristof

" COLORS {{{

" colorscheme solarized        " Eyes-friendly colorscheme
" let python_highlight_all=1   " Enable all Python syntax highlighting features
syntax on                    " Enable syntax highlighting

" }}}
" SPACES AND TABS {{{

set tabstop=4               " Number of visual spaces per tab
set softtabstop=4           " Number of spaces in tab when editing
set expandtab               " Tab are spaces
set autoindent              " Indent when moving to the next line while writing code
set shiftwidth=4            " When using the >> or << commands, shift lines by 4 spaces
set textwidth=120           " Break lines when line length increases
" Make backspaces more powerfull
set backspace=indent,eol,start

" }}}
" UI CONFIG {{{

set number                  " Show line numbers
set relativenumber          " Enable relative numbers
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
filetype indent on          " Load filetype-specific indent files
set wildmenu                " Visual autocomplete for command menu
set lazyredraw              " Redraw only when needed (faster macros)
set showmatch               " Highlight matching parenthesis
set mouse=a                 " Enable the mouse
set cursorline              " Show a visual line under the cursor's current line 
set splitbelow              " Open split below
set splitright              " Open split right
" Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" }}}
" SEARCHING {{{

set incsearch               " Search as you type
set hlsearch                " Highlight matches
set ignorecase              " Ignore case by default
" Turn off search highlight
nnoremap <silent> <Leader><Space> :nohlsearch<CR>
" }}}
" FOLDING {{{

set foldenable              " Enable folding
set foldlevelstart=10       " Open most folds by default
set foldnestmax=10          " Maximum nested folds
set foldmethod=indent       " Fold based on indent
set modelines=1             " Tells vim to check the last line for a modeline
set foldignore=             " Set foldignore to nothing to fold Python methods starting with a comment (#)
" Space toggles folds
nnoremap <Space> za 
" Space creates folds in visual mode
vnoremap <Space> zf         

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
nnoremap j gj
nnoremap k gk
" Highlight last inserted text
nnoremap gV `[v`]

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
" Toggle Gundo
" nnoremap <Leader>u :GundoToggle<CR>
" Edit vimrc
nnoremap <Leader>vc :tabe ~/.vimrc<CR>
" Save session
nnoremap <Leader>s :mksession<CR>
" Open ag.vim
" nnoremap <Leader>a :Ag
" Open vimrc in a new tab
map <leader>vc :tabe ~/.vimrc<cr>

" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>

"}}}
" MISC {{{

set nocompatible            " Ditch vi
" jk is <Esc>
inoremap jk <Esc> 
" Allows to enter new line without entering insert mode
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>

" }}}
" CTRLP SETTINGS {{{
" let g:ctrlp_match_window = 'bottom,order:ttb'

" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g \"\"'

" }}}
" LAUNCH CONFIG {{{

" Pathogen comes here
" call pathogen#infect()    " Launch Pathogen
" call pathogen#runtime_append_all_bundles()

" }}}
" AUTOCOMMANDS {{{

" Wrapped in augroup to ensure autocmd are applied only once
augroup configgroup
    " Clear all autocmd for the current group
    autocmd!
    " Remove the background of the first column (useful for certain colorscheme)
    autocmd VimEnter * highlight clear SignColumn
    " Remove all useless white spaces
    autocmd BufWritePre *.py,*.md,*.txt :call <SID>StripTrailingWhitespaces()
    " Set comment pattern for Python files
    autocmd Filetype python setlocal commentstring=#\ %s
    " Save fold state when quitting 
    autocmd BufWinLeave *.py mkview
    "  Restore on open
    autocmd BufWinEnter *.py silent loadview
    " Automatically sources changes in vimrc when file is saved
    autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

" }}}
" CUSTOM FUNCTIONS {{{

" Strips trailing whitespace at the end of files. This
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" Config .vimrc folding (works with modelines)
" vim:foldmethod=marker:foldlevel=0
