local M = {}

M.configure = function()
  -- vim.g.ale_linters = {ruby = {'standardrb'}, eruby = {"erblint"}, elm = {'elm_ls'}}
  -- vim.g.ale_fixers = {
  --   ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  --   ruby = {'standardrb'},
  --   eruby = {'erblint'},
  --   dart = {'dart-format'},
  --   rust = {'rustfmt'},
  --   elm = {'elm-format'},
  --   javascript = {'prettier'},
  --   typescript = {'prettier'},
  --   typescriptreact = {'prettier'}
  -- }
  --
  -- vim.g.ale_linters_explicit = 1
  -- vim.g.ale_fix_on_save = 1
end

return M
