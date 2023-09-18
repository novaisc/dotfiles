local M = {}

function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Create a command :Format local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
  end, { buffer = bufnr })
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

M.flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.root_dir = function(fname)
  local util = require('lspconfig').util
  return util.root_pattern('.git')(fname)
      or util.root_pattern('tsconfig.base.json')(fname)
      or util.root_pattern('package.json')(fname)
      or util.root_pattern('.eslintrc.js')(fname)
      or util.root_pattern('.eslintrc.json')(fname)
      or util.root_pattern('tsconfig.json')(fname)
end

M.autostart = true

M.single_file_support = true

return M
