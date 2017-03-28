call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Useful plugs
Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neovimhaskell/haskell-vim'
Plug 'guns/vim-clojure-static'
Plug 'wlangstroth/vim-racket'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'jaawerth/nrun.vim'
Plug 'lervag/vimtex'

call plug#end()

" Config for Nerdtree
autocmd vimenter * NERDTree

" Ctrl + n to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Default NerdTreeTags open on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Close vim when NERDTree is the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" Config for the indent line
let g:indentLine_color_term = 239
let g:indentLine_char='┊'

" Adds a new line before the autocompleted bracket
let g:delimitMate_expand_cr=1

" Config for airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace ='Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline_section_z = airline#section#create(['windowswap', '', '%l%\/%L%', '\:%3v'])

" Config for vimtex
let g:vimtex_latexmk_callback=0
let g:tex_conceal = ""

" General config
set nocompatible
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set nowrap
set number
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nohlsearch
set incsearch
set ignorecase
set ruler

syntax enable
set background=dark
silent! colorscheme solarized

" Key bindings
autocmd filetype cpp nnoremap <F4> :!g++ -std=c++11  % -o %:r <CR>
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++11  % -o %:r && ./%:r<CR>

autocmd filetype tex nmap <F3> <plug>(vimtex-compile-toggle)
autocmd filetype tex nmap <F4> <plug>(vimtex-errors)
autocmd filetype tex nmap <F5> <plug>(vimtex-view)

nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
vnoremap <C-c> "+y

" Highlighting for transparent background
hi Normal ctermbg=none
highlight NonText ctermbg=none

" Custom highlighting for vimtex
highlight texMathMatcher ctermbg=none
highlight texMathZoneX ctermbg=none
highlight texRefLabel ctermbg=none
highlight texStatement ctermbg=none
