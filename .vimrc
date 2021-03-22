call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
set nocompatible
filetype plugin indent on
" SETTINGS
" INPUT
set autoindent
set backspace=indent,eol,start
set mouse=a

" DISPLAY
set number
set colorcolumn=81
set encoding=utf-8
set laststatus=2
set ruler
set linebreak

" WHITESPACE
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nojoinspaces
set list
set listchars=tab:⸽\ ,trail:␠

" strip trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

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
" prevent find next/prev from wrapping aound the ends of the file
" set nowrapscan
" autocomplete for command line
set wildmenu

" MAPPINGS
" clear all search highlights when <C-L> is pressed
nnoremap <C-L> :nohl<CR><C-L>
map <C-n> :NERDTreeToggle<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
