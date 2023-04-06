vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

vim.o.relativenumber = true

require('packer-plugins')
