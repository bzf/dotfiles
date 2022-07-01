local M = {}

require('bzf.packages').startup()
require('bzf.lsp').configure()

M.reload = function()
  require('plenary.reload').reload_module('bzf')
  require('bzf')

  require('bzf.packages').startup()
  require('bzf.packages').sync()
  require('bzf.lsp').configure()

  vim.notify("module bzf reloaded!", vim.log.levels.INFO, {})
end

vim.keymap.set('n', '<leader>r', M.reload)
