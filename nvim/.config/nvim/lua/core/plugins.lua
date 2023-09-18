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
  "morhetz/gruvbox",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "NvChad/nvim-colorizer.lua",
  { "b0o/SchemaStore.nvim" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  {'rafamadriz/friendly-snippets'},
  {
    "hrsh7th/nvim-cmp", -- Autocompletion
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
  {'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { -- Optional
      "williamboman/mason.nvim",
          build = function()
            pcall(vim.cmd, "MasonUpdate")
          end,
	  },
    { "williamboman/mason-lspconfig.nvim" },
	  { "neovim/nvim-lspconfig" }, -- Required
    {	"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "jayp0521/mason-null-ls.nvim" },
		},
	},
})
