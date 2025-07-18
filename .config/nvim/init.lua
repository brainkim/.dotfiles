-- Set up lazy.nvim
local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug("neovim/nvim-lspconfig")
Plug("preservim/nerdtree")
Plug("ctrlpvim/ctrlp.vim")
Plug("editorconfig/editorconfig-vim")
Plug("roryokane/detectindent")
Plug("github/copilot.vim")
vim.call('plug#end')

-- General settings
-- Apply the settings you would otherwise place in your vimrc
vim.cmd [[
syntax on
filetype plugin indent on
]]
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.backspace = 'indent,eol,start'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.colorcolumn = '81'
vim.opt.encoding = 'utf-8'
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.linebreak = true
vim.opt.joinspaces = false
vim.opt.list = true
vim.opt.listchars = 'tab:· ,nbsp:␣,trail:·,extends:⟩,precedes:⟨'
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.hlsearch = true
vim.opt.wildmenu = true

-- Use tree view in netrw by default
vim.g.netrw_liststyle = 3

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e"
})

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-L>', ':nohlsearch<CR><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, {scope="line"})<CR>', { noremap = true, silent = true })
-- Jump to next diagnostic and open it in a floating window
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next()
  vim.diagnostic.open_float()
end, { desc = "Go to next diagnostic and show details" })

-- Jump to previous diagnostic and open it in a floating window
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
  vim.diagnostic.open_float()
end, { desc = "Go to previous diagnostic and show details" })

-- LSP configuration
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  -- Your mappings and additional setup go here
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
  -- Additional mappings can be added here
end

-- Setup the LSP servers you use
lspconfig.ts_ls.setup({on_attach = on_attach})
lspconfig.zls.setup({on_attach = on_attach})
