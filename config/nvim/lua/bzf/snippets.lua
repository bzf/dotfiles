local M = {}

M.configure = function()
  local ls = require"luasnip"

  ls.config.setup {
    history = true,
    update_events = "TextChanged,TextChangedI",
  }

  -- Make sure we don't have any existing snippets (useful when reloading)
  ls.cleanup()

  vim.keymap.set({"i", "s"}, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jumpable(-1)
    end
  end, { silent = true })

  vim.keymap.set("i", "<C-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)

  ls.add_snippets("all", {
    ls.parser.parse_snippet("test", "-- this is what was expandend")
  })
end

return M
