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
vim.opt.cursorline = true


-- map leader to space is not using <Space>
vim.api.nvim_set_var('mapleader', ' ')


vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
vim.fn['plug#']('hoob3rt/lualine.nvim')
vim.fn['plug#']('kyazdani42/nvim-web-devicons')
vim.fn['plug#']('lilydjwg/fcitx.vim')
vim.fn['plug#']('windwp/nvim-autopairs')
vim.fn['plug#end']()

-- lualine
require('lualine').setup({options={theme = "onelight"}})

-- markdown
-- https://github.com/tpope/vim-markdown
-- http://vimcasts.org/episodes/how-to-fold/
vim.g.markdown_folding = 1
vim.g.markdown_minlines = 100
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'vue', 'javascript', 'typescript'}

require('nvim-autopairs').setup{}


-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 85
vim.g.netrw_browse_split = 2
