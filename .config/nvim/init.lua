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

vim.g.NERDTreeFileLines = 1

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
-- ts_ls runs tsserver, which TypeScript 7 no longer ships; 7 serves LSP
-- from tsc itself. A project whose own TypeScript is older than 7 gets ts_ls,
-- and everything else gets TypeScript 7's server.
local function typescript(root)
  for dir in vim.fs.parents(vim.fs.joinpath(root, '_')) do
    local pkg = vim.fs.joinpath(dir, 'node_modules/typescript/package.json')
    if vim.uv.fs_stat(pkg) then
      local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg), '\n'))
      return ok and tonumber(tostring(data.version):match('^(%d+)')) or nil, dir
    end
  end
end

local function only(name, wanted)
  local root_dir = vim.lsp.config[name].root_dir
  vim.lsp.config(name, {
    root_dir = function(bufnr, on_dir)
      root_dir(bufnr, function(root)
        if wanted(typescript(root)) then
          on_dir(root)
        end
      end)
    end,
  })
end

local function before7(major)
  return major ~= nil and major < 7
end

only('ts_ls', before7)
only('tsgo', function(major) return not before7(major) end)
vim.lsp.config('tsgo', {
  cmd = function(dispatchers, config)
    local major, dir = typescript(config.root_dir)
    local tsc = major and major >= 7 and vim.fs.joinpath(dir, 'node_modules/.bin/tsc') or 'tsc'
    return vim.lsp.rpc.start({ tsc, '--lsp', '--stdio' }, dispatchers)
  end,
})
vim.lsp.enable({ 'ts_ls', 'tsgo', 'zls' })

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
