" 可以执行 :help vim-difference 来查看 nvim 的默认值
set number
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
syntax enable
" nvim 默认开启 autoindent
set smartindent
set expandtab


" 剪切版的设置
" 详细: https://snitxmhm.github.io/2020/04-30-Archlinux%E4%B8%8Bneovim%E4%B8%8E%E7%B3%BB%E7%BB%9F%E5%89%AA%E5%88%87%E6%9D%BF%E4%BA%92%E9%80%9A/
" 你可以和我一样, 安装这个 sudo pacman -S xsel
set clipboard+=unnamedplus

