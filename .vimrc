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
" Plug 'romainl/flattened'
" Delete buffers as it should be done
Plug 'moll/vim-bbye'
" Combine with netrw to create a delicious salad dressing
" Plug 'tpope/vim-vinegar'
" Create your own text objects
Plug 'kana/vim-textobj-user'
" The missing motion for vim
Plug 'justinmk/vim-sneak'
" Enable repeating of some actions
Plug 'tpope/vim-repeat'
" Add git signs in the left column
Plug 'airblade/vim-gitgutter'
" Git wrapper so awesome it should be illegal
Plug 'tpope/vim-fugitive'
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
" Autocompletion for Python
Plug 'davidhalter/jedi-vim'
" Python syntax highlighting
Plug 'vim-python/python-syntax'
" Python indent style complying with PEP8
Plug 'hynek/vim-python-pep8-indent'
" Python syntax checking
Plug 'nvie/vim-flake8'
" No-BS Python code folding
Plug 'tmhedberg/simpylfold'
" Light-weight tab-completion
Plug 'ajh17/vimcompletesme'
" Markdown
Plug 'SidOfc/mkdx'
" Pandoc integration and utilities
" Plug 'vim-pandoc/vim-pandoc'
" Pandoc's Markdown syntax
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Pandoc integration with third-party plugins
" Plug 'vim-pandoc/vim-pandoc-after'
" Modern plugin to edit LaTeX files
Plug 'lervag/vimtex'
" Speed up updating folds
Plug 'konfekt/fastfold'
" Look up words on online Thesaurus
Plug 'beloglazov/vim-online-thesaurus'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Simple tmux status line generator
Plug 'edkolev/tmuxline.vim'
" MatchParen for HTML tags
Plug 'gregsexton/matchtag'
" Ghetto HTML mappings
Plug 'tpope/vim-ragtag'
" Filter and align texts
Plug 'godlygeek/tabular'
" Text object for HTML attributes
Plug 'victorkristof/vim-textobj-xmlattr'
" Restore focus event
Plug 'tmux-plugins/vim-tmux-focus-events'
" Continuously updated session files
Plug 'tpope/vim-obsession'

" Initialize plugin system
call plug#end()

" }}}
" MISC {{{

set nocompatible            " Ditch vi
" filetype indent on          " Load filetype-specific indent files
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
" Fix delay when exiting visual and command mode with <ESC>
set ttimeoutlen=1
" jk is <Esc>
inoremap jk <ESC>
" Leave Ex mode for good
nnoremap Q <Nop>
" Y behaves like C and D
nnoremap Y y$

" }}}
" LEADER SHORTCUTS {{{

let mapleader=","           " Leader is comma
let maplocalleader='\'      " Local leader is backslash
" Edit vimrc in new tab
nnoremap <Leader>vc :tabe ~/.dotfiles/.vimrc<CR>
" Source vimrc and reload current buffer, syntax is lost otherwise
nnoremap <Leader>sc :source ~/.vimrc<CR>:e<CR>
" Paste from clipboard
nnoremap <Leader>p :r !pbpaste<CR>

" }}}
" JOURNAL {{{

" Bring up journal (with capital if problems with mark)
nnoremap <CR>J :tabe ~/Documents/research/journal.md<CR>
nnoremap <CR><CR> :tabnew<CR>`J
" Bring up reading list
nnoremap <CR>R :tabe ~/Documents/research/reading-list.md<CR>
nnoremap <CR>r :tabnew<CR>`R
" Bring up ideas file
nnoremap <CR>i :tabe ~/Documents/research/ideas.md<CR>
" nnoremap <CR>i :tabnew<CR>`I
" Bring up snippets
nnoremap <CR>S :tabe ~/Documents/research/snippets.md<CR>
nnoremap <CR>s :tabnew<CR>`S
" Bring up learn file
nnoremap <CR>L :tabe ~/Documents/research/learn.md<CR>
nnoremap <CR>l :tabnew<CR>`L
" Bring up blog file
nnoremap <CR>B :tabe ~/Documents/research/blog.md<CR>
nnoremap <CR>b :tabnew<CR>`B

augroup specialfiles
    autocmd!
    " Add new day
    autocmd BufWinEnter journal.md nnoremap <buffer> <Localleader>nd i<CR>## <C-r>=strftime('%d-%m-%Y')<CR><CR><CR><CR><Up><C-[>
    " Add 'learned today'
    autocmd BufWinEnter journal.md nnoremap <buffer> <Localleader>lt i### Learned today<CR><CR>
    " Add new entry
    autocmd BufRead journal.md nnoremap <buffer> <Localleader>ne o### <CR><CR><CR><C-[>3kA
    " Add new tags for entry
    autocmd BufRead journal.md nnoremap <buffer> <Localleader>nt iTags: []<Left>
    " Set mark when leaving files
    autocmd BufLeave journal.md :normal mJ
    autocmd BufLeave reading-list.md :normal mR
    autocmd BufLeave ideas.md :normal mI
    autocmd BufLeave snippets.md :normal mS
    autocmd BufLeave learn.md :normal mL
    autocmd BufLeave blog.md :normal mB
    " Persistent folds
    autocmd FileType pandoc setlocal viewoptions-=options
    autocmd BufLeave ~/Documents/research/*.md mkview
    autocmd BufEnter ~/Documents/research/*.md silent loadview
    " Check document in the list: transfer it to the 'Read' section with " date
    " Add a mark in 'r' register at '## Read' line
    autocmd BufRead reading-list.md :call setpos("'r", [0, search("## Read"), 0, 0])
    autocmd BufRead reading-list.md nnoremap <buffer> <C-x> m'dd'rjp0lli<C-r>=strftime('%d-%m-%Y')<CR>: <C-[>''
    " Add new link to list
    autocmd BufRead reading-list.md nnoremap <buffer> <Localleader>nl o- [](<C-r>*)<C-[>03li
    " Add new Mendeley entry
    autocmd BufRead reading-list.md nnoremap <buffer> <Localleader>nm o- [Mendeley]:<Space>
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
set visualbell              " Visual error
set lazyredraw              " Redraw only when needed (faster macros)
set ttyfast                 " Faster redraw
set mouse=a                 " Enable the mouse
set splitbelow              " Open split below
set splitright              " Open split right
set laststatus=2            " Always display status line
set wrap linebreak nolist   " Soft wrap text longer than window width
set showbreak=↪             " Better line wraps
set scrolloff=2             " Gives 2 lines of context above and bellow cursor
" Show characters with set list
set listchars=tab:▸\ ,eol:¬,space:•,nbsp:~

" Set default font in GUI
" To install: brew cask install font-sourcecodepro-nerd-font-mono
" set guifont=Menlo\ for\ Powerline:h14
set guifont=SauceCodePro\ Nerd\ Font:h14
" Cursor blinks only in insert mode
set guicursor+=n-v-c:blinkon0
" Display a vertical line at width 80 and 120
set colorcolumn=80
" Set background of cursor line number to be the same as column
highlight CursorLineNr ctermbg=7 guibg=#eee8d5
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

" }}}
" SPELLING {{{

" Fix spelling error
nnoremap <Leader>ff 1z=
" Fix previous spelling error and come back to position
nnoremap <Leader>fp [s1z=<C-o>
" Fix next spelling error and come back to position
nnoremap <Leader>fn ]s1z=<C-o>
" Fix last spelling error from insert mode
inoremap <C-f> <C-[>[s1z=<C-o>a

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
set formatoptions=tqwn1j
" Format a paragraph according to the text width
nnoremap gQ m`gqip``
" Format till the end of the paragraph
nnoremap g} gq}<C-o>
" Join all line inside a paragraph
nnoremap gJ m`vipJ``
" Format in visual mode
vnoremap q gq
" Indent whole file
nnoremap g= gg=G``

" }}}
" FILES AND BUFFERS {{{

" Automatically reload files when changed from outside vim
set autoread
" Visual autocomplete for command menu
set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pkl,*.npy,*.spy
set wildignore+=*.pdf,*.psd
" Edit new file in current window
nnoremap <Leader>e :e **/*
" Edit new file in vertical split buffer
nnoremap <leader>E :vs <C-z><S-Tab>
" Set ctrl-z as trigger to autocompletion in macros
set wildcharm=<C-z>
" List buffers and open prompt
nnoremap <leader>b :buffer <C-z><S-Tab>
" nnoremap <leader>b :buffer **/*
" List buffers and open prompt, enter will open in split
nnoremap <leader>B :vert :sbuffer <C-z><S-Tab>
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" Reload current file (useful when debugging new setting in vimrc)
nnoremap <Leader>r :e %<CR>

" }}}
" WINDOWS {{{

" Windows are automatically made the same size
set equalalways
" These mappings don't work:
" https://vi.stackexchange.com/questions/8856/mapping-ctrl-with-equal-sign
" " Increase height of window
" nnoremap <C-+> <C-w>+
" " Decrease height of window
" nnoremap <C--> <C-w>-
" " Increase width of window
" nnoremap <C-.> <C-w>>
" " Decrease width of window
" nnoremap <C-,> <C-w><

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
" Highlight last inserted text
nnoremap gV `[v`]
" Switch between alternate buffers
nnoremap <Tab> <C-^>

" }}}
" {{{ INSERT MODE

" Go to end of line
inoremap AA <C-[>A
" Go to beginning of line
inoremap II <C-[>I
" Start new line
inoremap OO <C-[>o
" Add ( at the end of line
" inoremap (( <C-[>I(
" Add ) at the end of line
" inoremap )) <C-[>A)<Space>
" Add : at the end of line
" inoremap :: <C-[>A:<Space>
" Insert current day
inoremap <C-d> <C-r>=strftime('%d-%m-%Y')<CR>
" Put yank register
inoremap <C-p> <C-r>"

" }}}
" VISUAL MODE {{{

" Allows to use dot command in visual mode
vnoremap . :norm.<CR>
" Visual shifting (does not exit visual mode)
vnoremap < <gv
vnoremap > >gv

"}}}
" SNEAK {{{

" Use s to continue search, as clever-f
let g:sneak#s_next = 1
" s and S always go forward and backward, respectively
let g:sneak#absolute_dir = 1
" Enable label mode (try it first...)
" let g:sneak#label = 1
" Remap to use f and t
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" Remap previous to free \ for localleader
map gS <Plug>Sneak_,

" Change color
" hi Sneak guifg=black guibg=red ctermfg=red ctermbg=none cterm=underline,bold gui=underline

" }}}
" VIMCOMPLETESME {{{

" Cycle backward
let g:vcm_direction = 'p'

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
let g:SimpylFold_docstring_preview = 0
" " Do not fold imports
let g:SimpylFold_fold_import = 0

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
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org|text|asciidoc|tex|mail'
let g:airline#extensions#tmuxline#enabled = 0 " Disable as custom theme
let g:airline#extensions#obsession#enabled = 1 " Enable vim-obsession marker

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
" SYNTASTIC {{{

" Symbols
let airline#extensions#syntastic#warning_symbol = '⚑'
" Syntastic recommended settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Set the height of the location list
let g:syntastic_loc_list_height = 5

" }}}
" JEDI {{{

" Disable auto configuration to disable documentation preview window (in python
" augroup)
let g:jedi#auto_vim_configuration = 0
" Disable window showing arguments of current function
let g:jedi#show_call_signatures = 0
" Open new split for 'go to'
let g:jedi#use_splits_not_buffers = "right"
" Use tabs instead of buffers when going to definition
let g:jedi#use_tabs_not_buffers = 1
" Map go to definition command
let g:jedi#documentation_command = "<Localleader>d"
" Show all usages of element under cursor
let g:jedi#usages_command = "<Localleader>u"
" Disable goto command, default: <leader>d
let g:jedi#goto_command = "<Localleader>g"
" Disable goto assignments, default: <leader>g
let g:jedi#goto_assignments_command = "<Localleader>a"
let g:jedi#rename_command = "<Localleader>r"
" Configure height of documentation preview window
let g:jedi#max_doc_height = 50

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
    " Disable docstring preview window for jedi-vim
    autocmd FileType python setlocal completeopt=menuone,longest
    " Remove automatic formatting in Python
    autocmd FileType python setlocal formatoptions-=a
    " Syntax setting
    " Functions in blue
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
" PANDOC {{{

" Disable fold column
let g:pandoc#folding#fdc = 0
" Blacklist some conceals
let g:pandoc#syntax#conceal#blacklist = ["codeblock_start", "codeblock_delim"]
" <localleader># transforms the current line into a ## header
let g:pandoc#keyboard#sections#header_style = '##'
" Conceal urls
let g:pandoc#syntax#conceal#urls = 0

augroup pandoc
    autocmd!
    " Enable autoformat and paragraph stop on line break
    autocmd FileType pandoc setlocal formatoptions+=aw
    " Create codeblock
    autocmd FileType pandoc nnoremap <buffer> <Localleader>cb o```<CR>```<C-[>O
augroup END

" }}}
" MARKDOWN {{{

augroup markdown
    autocmd!
    " Remove 80 chars delimiter
    " autocmd FileType markdown setlocal colorcolumn=
    autocmd FileType markdown setlocal foldlevel=1
    autocmd FileType markdown highlight OverLengthHard NONE
    autocmd FileType markdown highlight OverLengthSoft NONE
    " Render marked elements inline
    " autocmd FileType markdown set conceallevel=2
augroup END

let g:mkdx#map_prefix = '<localleader>'
nmap <localleader>X <Plug>(mkdx-checkbox-next)
vmap <localleader>X <Plug>(mkdx-checkbox-next)
nmap <localleader>x <Plug>(mkdx-checkbox-prev)
vmap <localleader>x <Plug>(mkdx-checkbox-prev)

nnoremap <localleader>b bi**<Esc>ea**

" Highlight JSON
" let g:vim_markdown_json_frontmatter = 1

" }}}
" LATEX {{{

" Enable folding
let g:vimtex_fold_enabled = 1
" Default .tex files to tex format
let g:tex_flavor = 'latex'
" Diable some warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \}
" Automatically close brackets
" let g:vimtex_complete_close_braces = 1

augroup latex
    autocmd!
    " Number of spaces per tab
    autocmd FileType tex setlocal tabstop=2
    " Number of spaces in tab when editing
    autocmd FileType tex setlocal softtabstop=2
    " Indent lines by 2 spaces
    autocmd FileType tex setlocal shiftwidth=2
    " Conceal level set to 2
    autocmd FileType tex setlocal conceallevel=0
    " Enable autoformat and paragraph stop on line break (useful for equation)
    " autocmd BufRead *.tex setlocal fo+=a
    " Disable colorcolumn
    autocmd FileType tex setlocal colorcolumn=
    " Insert math environment
    autocmd FileType tex nnoremap <buffer> <Localleader>m i$$<Left>
    " autocmd FileType tex inoremap <C-l>m $$<Left>
    autocmd FileType tex xnoremap <buffer> <Localleader>m c$<C-r>"$<C-[>
    " Insert latex vector easily
    autocmd FileType tex nnoremap <buffer> <Localleader>v i$\vect{}$<Left><Left>
    autocmd FileType tex inoremap <C-l>v \vect{
    autocmd FileType tex xnoremap <buffer> <Localleader>v c\vect{<C-r>"}<C-[>
    " Italics
    autocmd FileType tex nnoremap <buffer> <Localleader>i i\textit{}<Left>
    autocmd FileType tex inoremap <C-l>i \textit{
    autocmd FileType tex xnoremap <buffer> <Localleader>i c\textit{<C-r>"}<C-[>
    " Bold
    autocmd FileType tex nnoremap <buffer> <Localleader>b b\textbf{}<Left>
    autocmd FileType tex inoremap <C-l>b \textbf{
    autocmd FileType tex xnoremap <buffer> <Localleader>b c\textbf{<C-r>"}<C-[>
augroup END

" }}}
" HTML & CSS {{{

augroup html
    autocmd!
    " Disable column at 80 characters
    autocmd FileType html,htmldjango setlocal colorcolumn=
    " Number of spaces per tab
    autocmd FileType html,htmldjango setlocal tabstop=2
    " Number of spaces in tab when editing
    autocmd FileType html,htmldjango setlocal softtabstop=2
    " Indent lines by 2 spaces
    autocmd FileType html,htmldjango setlocal shiftwidth=2
    " Fold current tag
    autocmd FileType html,htmldjango nnoremap <buffer> <Localleader>ft Vatzf
augroup END

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
    " Save file when leaving insert mode
    autocmd InsertLeave *.* :w
    " Save file when losing focus
    autocmd FocusLost * :wa
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
" TEMP {{{
" A buffer for configuration to try

" Map <CR> to <CR><Space> to still be able to valide quickfix entries
nnoremap <CR><Space> <CR>


" }}}

" Configure .vimrc folding (works with modelines)
" vim:foldmethod=marker:foldlevel=0
