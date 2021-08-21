vim.cmd('syntax enable')

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = 'extends:❯,precedes:❮,tab:▸ ,trail:˽'
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 1000
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- map leader to space is not using <Space>
vim.api.nvim_set_var('mapleader', ' ')
--vim.api.nvim_set_keymap('n', '<leader>n', ':tabn<cr>', {noremap = true})
--vim.api.nvim_set_keymap('n', '<leader>p', ':tabp<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap = true})


vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
vim.fn['plug#']('hoob3rt/lualine.nvim')
vim.fn['plug#']('kyazdani42/nvim-web-devicons')
vim.fn['plug#']('ryanoasis/vim-devicons')
vim.fn['plug#']('~/code-for-fun/my-vim/AutoSave.nvim')
vim.fn['plug#']('kyazdani42/nvim-tree.lua')
vim.fn['plug#']('lilydjwg/fcitx.vim')
vim.fn['plug#']('liuchengxu/vim-clap', {['do'] = ':Clap install-binary'})
vim.fn['plug#']('nvim-lua/plenary.nvim')
vim.fn['plug#']('neovim/nvim-lspconfig')
vim.fn['plug#']('kabouzeid/nvim-lspinstall')
vim.fn['plug#']('hrsh7th/nvim-compe')
vim.fn['plug#']('sindrets/diffview.nvim')
vim.fn['plug#']('lewis6991/gitsigns.nvim')
vim.fn['plug#end']()

-- lualine
require('lualine').setup({options={theme = "onelight"}})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>1', ':NvimTreeFocus<cr>', {noremap = true})

-- AutoSave

local autosave = require("autosave")

autosave.setup(
{
  debounce_delay = 1000,
  conditions = {
    exists = true,
    filetype_is = {"javascript", "typescript", "lua", "markdown"},
    filetype_is_not = {},
    modifiable = true,
  },
})

-- markdown
-- https://github.com/tpope/vim-markdown
-- http://vimcasts.org/episodes/how-to-fold/
vim.g.markdown_folding = 1
vim.g.markdown_minlines = 100
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'vue', 'javascript', 'typescript'}


-- lewis6991/gitsigns.nvim
require('gitsigns').setup()


-- lsp
require('my-config/lsp')
