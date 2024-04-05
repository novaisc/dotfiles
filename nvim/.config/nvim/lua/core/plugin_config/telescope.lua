local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- live grep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) --help tags

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
}


