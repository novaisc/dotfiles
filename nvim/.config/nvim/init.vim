source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/lsp-config.vim

"Lua Plugins
luafile $HOME/.config/nvim/lua/compe-config.lua
luafile $HOME/.config/nvim/lua/lsp/tsserver-ls.lua
luafile $HOME/.config/nvim/lua/lsp/clangd-ls.lua
luafile $HOME/.config/nvim/lua/lsp/css-ls.lua
luafile $HOME/.config/nvim/lua/lsp/html-ls.lua
luafile $HOME/.config/nvim/lua/lsp/json-ls.lua
luafile $HOME/.config/nvim/lua/lsp/texlab.lua
luafile $HOME/.config/nvim/lua/lsp/py_lsp.lua

set clipboard+=unnamedplus
set hidden
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
"set mouse=a
set background=dark
"set inccommand=split
"set linebreak

lua require("plugin-config")

inoremap kj <esc>

