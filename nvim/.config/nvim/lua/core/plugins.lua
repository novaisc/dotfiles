local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- theme
  "morhetz/gruvbox",
  -- file manager
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  -- line on bottom of the screen
  "nvim-lualine/lualine.nvim",
  --highlight
  "nvim-treesitter/nvim-treesitter",
  { "b0o/SchemaStore.nvim" },
  -- auto pairs () {} []
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  -- manage buffers
  {
    "moll/vim-bbye", -- Delete buffers without closing windows or messing up your layout
    config = function()
      require("core.plugin_config.vim-bbye")
    end,
    event = "BufWinEnter",
  },

  -- manage tabs
  { "akinsho/bufferline.nvim",     version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- snippets
  { 'rafamadriz/friendly-snippets' },

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("core.plugin_config.nvim-cmp")
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("core.plugin_config.luasnip")
        end,
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
    },
    event = 'InsertEnter',
  },

  --markdown-preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {
        "markdown" }
    end,
    ft = {
      "markdown" },
  },

  -- comment
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    "rcarriga/nvim-notify", -- Beautiful notifications
    config = function()
      require("core.plugin_config.notify")
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- Java Support
  {
    "mfussenegger/nvim-jdtls",
  },

  -- search
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3', -- or, branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- lsp
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
  },
  {
    "mason-org/mason-registry"
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" }, -- Required
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      { "jayp0521/mason-null-ls.nvim" },
    },
  },
})
