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

"Plug 'kyazdani42/nvim-tree.lua'
" Plug 'sindrets/diffview.nvim'
Plug '~/code-for-fun/my-vim/AutoSave.nvim' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lilydjwg/fcitx.vim'
" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'Th3Whit3Wolf/space-nvim'
call plug#end()


let mapleader="\<space>"
nnoremap <leader>n :tabn<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l


" theme
colorscheme space-nvim

" spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2   " number of spaces to use for autoindent
set expandtab       " tabs are space
" }}} Spaces & Tabs


" nvim-tree
nnoremap <leader>1 :NvimTreeFocus<CR>

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

" markdown
" https://github.com/tpope/vim-markdown
" http://vimcasts.org/episodes/how-to-fold/
let g:markdown_folding = 1
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'vue', 'javascript', 'typescript']

" lsp

lua << EOF
vim.o.completeopt = "menuone,noselect"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local on_attach = function()
  require('compe').setup({
    min_length= 2,
    source = {path = true, buffer = true, nvim_lsp = true, nvim_lua = true, spell = true}
  }, 0)
end


require('lspinstall').setup() -- important
require('lspconfig').lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
EOF
