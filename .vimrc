set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
" LANGUAGE-SPECIFIC
Plug 'GutenYe/json5.vim'
let g:vim_json_syntax_conceal = 0
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype on
filetype plugin indent on
syntax on

" SETTINGS
" INPUT
set autoindent
set backspace=indent,eol,start
set mouse=a

" DISPLAY
set colorcolumn=81
set encoding=utf-8
set number
set laststatus=2
set ruler

" WHITESPACE
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" BELLS
set noerrorbells
set novisualbell

" CODE FOLDING
set foldmethod=indent
" disable all folding by default
set foldlevel=99

" SEARCH
" highlight matches
set hlsearch
set ignorecase
" prevent find next/prev from wrapping aound the ends of the file
set nowrapscan
set smartcase
" autocomplete for command line
set wildmenu

" MAPPINGS
nnoremap ; :
" clear all search highlights when <C-L> is pressed
nnoremap <C-L> :nohl<CR><C-L>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
