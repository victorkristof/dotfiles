" Victor Kristof
                                                                               
" VIM-PLUG {{{

" I use vim-plug as plugin manager: https://github.com/junegunn/vim-plug
" You can specify a directory for plugins (.vim/plugged/ by default)
call plug#begin()

" Plugins come here - make sure you use single quotes

" Using % will match more than one character
Plug 'matchit.zip'
" Multiple selection for VIM (SublimeText-like)
Plug 'terryma/vim-multiple-cursors'
" Solarized for vim" 
Plug 'altercation/vim-colors-solarized'
" NERDtree to get a tree view of your project
Plug 'scrooloose/nerdtree'
" Add git flags in NERDtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Add git signs in the left column
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()


" }}}
" COLORS {{{

syntax enable               " Enable syntax highlighting
set background=light        " Use light theme
colorscheme solarized       " Eyes-friendly colorscheme
" let python_highlight_all=1   " Enable all Python syntax highlighting features

" }}}
" SPACES AND TABS {{{

set tabstop=4               " Number of noremappaces per tab
set softtabstop=4           " Number of spaces in tab when editing
set expandtab               " Tab are spaces
set autoindent              " Indent when moving to the next line while writing
set shiftwidth=4            " Indent lines by 4 spaces
" Make backspaces more powerfull
set backspace=indent,eol,start
" Add blank line above cursor
nnoremap J o<ESC>
" Add blank line below cursor
nnoremap K O<ESC>

" }}}
" UI CONFIG {{{

set number                  " Show line numbers
set relativenumber          " Enable relative numbers
set showcmd                 " Show command in bottom bar
set cursorline              " Highlight current line
filetype indent on          " Load filetype-specific indent files
filetype plugin on          " Load^fileypte-specific plugins
set wildmenu                " Visual autocomplete for command menu
set lazyredraw              " Redraw only when needed (faster macros)
set ttyfast                 " Faster redraw
set showmatch               " Highlight matching parenthesis
set mouse=a                 " Enable the mouse
set splitbelow              " Open split below
set splitright              " Open split right
set foldcolumn=2            " Display column on the left that shows folds
set laststatus=2            " Always display statusline
set wrap linebreak nolist   " Softwrap text longer than window width
" set textwidth=120           " Break lines when line length increases
" Set default font in GUI
set guifont=Menlo\ Regular:h14
" Display a vertical line at width 80 and 120
set colorcolumn=80,120
" Set color of column on the right
highlight ColorColumn ctermbg=254 guibg=#eee8d5
" Display a vertical line at width 80 and color background after width 120
" let &colorcolumn="80,".join(range(120,999),",")
" Highlight text over 80 characters
highlight OverLengthSoft ctermfg=166 guibg=#592929
match OverLengthSoft /\%80v.\+/
" Highlight text over 120 characters
highlight OverLengthHard ctermfg=124 guibg=#592929
2match OverLengthHard /\%120v.\+/
" Set color of line number background
highlight CursorLineNr guibg=#eee8d5
" Informative status line
set statusline=%F%m%r%h%w\ [%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
" Increase size of buffer window
nnoremap + <C-w>+
" Decrease size of buffer window
nnoremap _ <C-w>-

" }}}
" SEARCHING {{{

set incsearch               " Search as you type
set hlsearch                " Highlight matches
set ignorecase              " Ignore case by default
" Turn off search highlight
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" }}}
" FOLDING {{{

set foldenable              " Enable folnoremappace toggles folds
nnoremap <Space> za 
" Space creates folds in visual mode
vnoremap <Space> zf         
" Toggles all folds in file
nnoremap - :call ToggleAllFolds()<CR>:echo<CR>
" Change color of folded code
highlight Folded ctermbg=grey

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
" Facilitate navigation between buffers
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
" Toggle Gundo
" nnoremap <Leader>u :GundoToggle<CR>
" Edit vimrc in new tab
nnoremap <Leader>vc :tabe ~/.vimrc<CR>
" Save session
nnoremap <Leader>s :mksession<CR>
" Open ag.vim
" nnoremap <Leader>a :Ag

" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>
" Visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv

"}}}
" MISC {{{

set nocompatible            " Ditch vi
" jk is <Esc>
inoremap jk <Esc> 

" }}}
" CTRLP SETTINGS {{{
" let g:ctrlp_match_window = 'bottom,order:ttb'

" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g \"\"'

" }}}
" MULTI-CURSOR SETTINGS {{{

" Replace defaults
let g:multi_cursor_use_default_mapping=0
" Do not loose all cursors when escaping from insert mode
let g:multi_cursor_exit_from_insert_mode=0
" Do not loos all cursors when escaping from visual mode
let g:multi_cursor_exit_from_visual_mode=0
" Turns selection into cursors with Ctrl-m
nnoremap <silent> <C-m> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <C-m> :MultipleCursorsFind <C-R>/<CR>
" Change key mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" }}}
" NERDTREE {{{

" Toggle NERDtree
noremap <Leader>t :NERDTreeToggle<CR>
" Open NERDtree if no file is specified when launching vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if NERDtree is the only open window
autocmd bufenter * if (winnr("$") == 1 
    \ && exists("b:NERDTree") 
    \ && b:NERDTree.isTabTree()) | q | endif

" }}}
" GITGUTTER {{{

" Remap hunk movements
nmap )h <Plug>GitGutterNextHunk
nmap (h <Plug>GitGutterPrevHunk

" }}}
" AUTOCOMMANDS {{{

" Wrapped in augroup to ensure autocmd are applied only once
augroup configgroup
    " Clear all autocmd for the current group
    autocmd!
    " Remove the background of the fold column
    " autocmd VimEnter * highlight clear FoldColumn
    " Remove the background of the sign column
    autocmd VimEnter * highlight clear SignColumn
    " Remove all useless white spaces
    autocmd BufWritePre *.py,*.md,*.txt :call StripTrailingWhitespaces()
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

" Stnoremappace at the noremapiles. 
" This is called on buffer write in the autogroup above.
function! Stnoremappaces()
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

" Config .vimrc folding (works with modelines)
" vim:foldmethod=marker:foldlevel=0
