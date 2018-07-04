set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" NOTE(brian): Open nerdtree on ctrl-n
map <C-n> :NERDTreeToggle<CR>
Plugin 'L9'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'

" Language plugins
Plugin 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
Plugin 'pangloss/vim-javascript'
" Plugin 'styled-components/vim-styled-components'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'leafgarland/typescript-vim'
Plugin 'jparise/vim-graphql'
Plugin 'alexlafroscia/postcss-syntax.vim'
call vundle#end()

filetype on
filetype plugin indent on

syntax on

" Settings
set confirm
set nowrapscan
set wildmenu
set showcmd
set hlsearch
set nomodeline
set encoding=utf-8
set ignorecase
set smartcase
set backspace=indent,eol,start
set ruler
set laststatus=0
set mouse=a
set number
set relativenumber
set novisualbell
set noerrorbells
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set foldmethod=syntax
set foldlevel=99

" Mappings
let mapleader = ","
nnoremap <C-L> :nohl<CR><C-L>
nnoremap ; :

au VimLeave * :!clear
