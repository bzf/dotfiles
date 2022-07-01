local M = {}

M.configure = function()
  local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    vim.keymap.set('n', 'cr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
  end

  require('lspconfig').solargraph.setup { on_attach = on_attach }
  require('lspconfig').tsserver.setup { on_attach = on_attach }
  require('lspconfig').rust_analyzer.setup { on_attach = on_attach }
  require('lspconfig').elmls.setup { on_attach = on_attach }
end

return M
