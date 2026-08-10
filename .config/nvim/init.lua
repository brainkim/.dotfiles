-- Set up lazy.nvim
local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug("neovim/nvim-lspconfig")
Plug("preservim/nerdtree")
Plug("ctrlpvim/ctrlp.vim")
Plug("editorconfig/editorconfig-vim")
Plug("roryokane/detectindent")
-- Plug("github/copilot.vim")
Plug("lewis6991/gitsigns.nvim")
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
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
-- Exit terminal mode with Esc
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Auto-enter insert mode when navigating to terminal
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert"
})

-- LSP configuration
-- nvim-lspconfig's require('lspconfig')...setup() framework is deprecated as
-- of Nvim 0.11; configs now live under lsp/ and are activated via
-- vim.lsp.config()/vim.lsp.enable(). See :help lspconfig-nvim-0.11
vim.lsp.enable({ 'ts_ls', 'zls' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, vim.tbl_extend('force', opts, { desc = 'Go to next diagnostic and show details' }))
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, vim.tbl_extend('force', opts, { desc = 'Go to previous diagnostic and show details' }))
  end,
})

-- Treesitter configuration (will work after running :PlugInstall)
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ok then
  treesitter.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "bash", "json", "yaml", "markdown" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    },
  }
end

-- Neovim 0.10 sets opaque background colors
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
