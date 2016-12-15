" NOTE(brian): OK so this line is b/c there's a thing called vi that is
" sometimes opens instead of vim or something but this is V(improved) so this
" is better or I dunno what's really happening.
set nocompatible

" NOTE(brian): Vundle says I gotta turn filetype off before I Bundle or Plugin
" or whatever. I don't really know what filetype does or why Bundle or Plugin
" or Vundle even needs it to be turned off? Sounds dangerous. Also they
" fucking breaking these apis I hate them.
filetype off

" NOTE(brian): I have no idea what +=~/ could possibly mean what if oh wait, I
" think the second half must be `~/.vim` but I still have no idea what we
" could be `+=`-ing to rtp. Unless that thing is Vundle? How do I install
" Vundle?
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" NOTE(brian): Open nerdtree on ctrl-n
map <C-n> :NERDTreeToggle<CR>
Plugin 'scrooloose/nerdcommenter'

" NOTE(brian): I feel like I have no luck with tpope stuff
" Plugin 'tpope/vim-git'
" Plugin 'tpope/vim-fugitive'

Plugin 'gioele/vim-autoswap'
let g:autoswap_detect_tmux = 1 

Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'elzr/vim-json'
" NOTE(brian): stop hiding my quotes in json please
let g:vim_json_syntax_conceal = 0

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" NOTE(brian): fuck you vim-jsx
let g:jsx_ext_required = 0
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'nfischer/vim-ohm'
Plugin 'darfink/vim-plist'

Plugin 'vim-scripts/paredit.vim'
Plugin 'kien/rainbow_parentheses.vim'
au BufEnter *.clj RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" Plugin 'joeytwiddle/sexy_scroller.vim'
" let g:SexyScroller_MaxTime=125
" let g:SexyScroller_EasingStyle=2
call vundle#end()

" NOTE(brian): this is the official end of the whole thing. Back to full power
" let's turn all the goddamn goodies on.
filetype on
filetype plugin indent on

" NOTE(brian): Gotta look at pgns man, should this be here or somewhere else?
au BufNewFile,BufRead *.pgn setf pgn

" NOTE(brian): Enable syntax highlighting (doy)?
syntax on
syntax on
syntax on

" NOTE(brian): ¿I don't understand?
" set hidden
set confirm

" NOTE(brian): Why is this next line commented out??
" set autowriteall

" NOTE(brian): this is the line that makes it so finding things doesn't wrap
" around or something.
set nowrapscan

" Better command-line completion
" NOTE(brian): I guess?
set wildmenu

" Show partial commands in the last line of the screen
" NOTE(brian): as opposed to "complete commands?"
set showcmd

" NOTE(brian): Highlight searches (use <C-L> to temporarily turn off
" highlighting; see the mapping of <C-L> below)
set hlsearch

" NOTE(brian): for security or something.
set nomodeline

" NOTE(brian): most definitely.
set encoding=utf-8

" Use case insensitive search, except when using capital letters
" NOTE(brian): this been a pretty good variable-finding heuristic.
set ignorecase
set smartcase

set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=0

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number
set relativenumber
" NOTE(brian): 😈

" NOTE(brian): please leave my eyeballs out of this
set novisualbell
set noerrorbells

" NOTE(brian): u are so dumb u can't never remember what any of these do.

" NOTE(brian): this is the thing that makes tabs become spaces
set expandtab
" NOTE(brian): this is the thing that sets the number of spaces that real tab makes?
set tabstop=2
" NOTE(brian): this is the thing that makes your stupid fake tabs SNAP to the tab grid.
set softtabstop=2
" NOTE(brian): this is ratio visual spaces / fake tab.
set shiftwidth=2

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" MAP -> PINGS.

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"" NOTE(brian): close NERDTree when you close a tab.
"let NERDTreeQuitOnOpen=1

" NOTE(brian): a leader is like a leading thing.
let mapleader = ","

" NOTE(brian): Remap semicolon to colon. But you should probably use semicolon
" anyways for the exercise.
nnoremap ; :

" Something for ctrl-p?
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" NOTE(brian): code folding
set foldmethod=syntax
" NOTE(brian): Don't fold any code without my permission.
set foldlevel=99

" NOTE(brian): make sure vim cleans itself up after you exit.
au VimLeave * :!clear
