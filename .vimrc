set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
" LANGUAGE-SPECIFIC
Plugin 'GutenYe/json5.vim'
let g:vim_json_syntax_conceal = 0
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'alexlafroscia/postcss-syntax.vim'
call vundle#end()

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
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" BELLS
set noerrorbells
set novisualbell

" CODE FOLDING
set foldmethod=syntax
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
