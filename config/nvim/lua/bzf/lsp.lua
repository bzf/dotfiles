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

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require('lspconfig').solargraph.setup { on_attach = on_attach, capabilities = capabilities }
  require('lspconfig').tsserver.setup { on_attach = on_attach, capabilities = capabilities }
  require('lspconfig').rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }
  require('lspconfig').elmls.setup { on_attach = on_attach, capabilities = capabilities }
  require('lspconfig').tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }
  require('lspconfig').dartls.setup { on_attach = on_attach, capabilities = capabilities }
end

return M
