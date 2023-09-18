vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.timeoutlen = 500   -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.ttimeoutlen = 10   -- time in milliseconds to wait for a key code sequence to complete
vim.opt.updatetime = 100   -- faster completion

vim.keymap.set('i', 'kj', '<Esc>', {noremap = true})

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- rename
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Replace Ctrl-w with Ctrl for split navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- navigate between tabs
vim.api.nvim_set_keymap('n', '<leader>bb', ':tabprev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bn', ':tabnext<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>c', ':tabclose<CR>', {noremap = true})

