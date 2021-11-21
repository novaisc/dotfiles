vim.g.completion_enable_snippet = 'UltiSnips'

require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
};

