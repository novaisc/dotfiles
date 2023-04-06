vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- open nerdtree
local api = require("nvim-tree.api")

-- empty setup using defaults
require("nvim-tree").setup()
