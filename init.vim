" 可以执行 :help vim-difference 来查看 nvim 的默认值
set number
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
syntax enable
" nvim 默认开启 autoindent
set smartindent
set expandtab
set termguicolors
set updatetime=1000

" 剪切版的设置
" 详细: https://snitxmhm.github.io/2020/04-30-Archlinux%E4%B8%8Bneovim%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%89%AA%E5%88%87%E6%9D%BF%E4%BA%92%E9%80%9A/
" 你可以和我一样, 安装这个 sudo pacman -S xsel
set clipboard+=unnamedplus


call plug#begin(stdpath('data') . '/plugged')
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'sindrets/diffview.nvim'
Plug '~/code-for-fun/my-vim/AutoSave.nvim' 
Plug 'projekt0n/github-nvim-theme'
Plug 'lilydjwg/fcitx.vim'
call plug#end()


let mapleader="\<space>"
nnoremap <leader>n :tabn<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l


" spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2   " number of spaces to use for autoindent
set expandtab       " tabs are space
" }}} Spaces & Tabs

" gitgutter 颜色配置
" https://jonasjacek.github.io/colors/
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


" nvim-tree
nnoremap <leader>1 :NvimTreeToggle<CR>

" AutoSave
lua << EOF
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
}
)
EOF

" Set lualine configuration before github-theme
lua require('lualine').setup({options={theme = "onelight"}})

" github-nvim-theme
lua << EOF
require('github-theme').setup()
EOF


" markdown
" https://github.com/tpope/vim-markdown
" http://vimcasts.org/episodes/how-to-fold/
let g:markdown_folding = 1
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'vue', 'javascript', 'typescript']

