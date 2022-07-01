local M = {}

M.configure = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  lspkind.init()

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'path' },
    }, {
      { name = 'buffer' },
    }),

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        mode = 'text',
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[lua]",
          path = "[path]",
        },
      },
    },

    experimental = {
      ghost_text = true,
    },
  })
end

return M
