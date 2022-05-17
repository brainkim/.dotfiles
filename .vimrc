call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'roryokane/detectindent'
Plug 'neovim/nvim-lspconfig'
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
set listchars=tab:·\ ,nbsp:␣,trail:·,extends:⟩,precedes:⟨

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
nnoremap gd :lua vim.lsp.definition()<CR>

lua << EOF
local lspconfig = require("lspconfig")

-- What is bufnr? Is it possible to do these mappings in vimrc? Who knows
local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true }

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

	-- Disables the annoying diagnostic text and popups entirely. How is this an
	-- acceptable configuration format???
	vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end

lspconfig.tsserver.setup {
	on_attach = on_attach
}
EOF
