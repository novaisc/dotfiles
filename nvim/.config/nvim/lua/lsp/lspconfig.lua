local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  return
end

local u = require('core.utils')
local default_config = require('lsp.servers.default')
local config = default_config

mason_lspconfig.setup {
  ensure_installed = { "clangd", "tsserver", "html", "cssls", "jsonls", "pyright",},
  automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
}

mason_lspconfig.setup_handlers {
  function(server_name)  -- default handler (optional)
    if server_name == 'jsonls' then
      config = u.merge(config, require('lsp.servers.jsonls'))
    elseif server_name == 'lua_ls' then
      config = u.merge(config, require('lsp.servers.lua_ls'))
    elseif server_name == 'clangd' then
      config = u.merge(config, require('lsp.servers.clangd'))
    elseif server_name == 'tsserver' then
      config = u.merge(config, require('lsp.servers.tsserver'))
    -- elseif server_name == 'pyright' then
    --   config = u.merge(config, require('lsp.servers.pyright'))
      return
    end

    lspconfig[server_name].setup(config)
  end,
}
