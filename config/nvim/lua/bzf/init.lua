local M = {}

require('bzf.packages').startup()

M.reload = function()
  require('plenary.reload').reload_module('bzf')
  require('bzf')

  require('bzf.packages').startup()
  require('bzf.packages').sync()

  vim.notify("module bzf reloaded!", vim.log.levels.INFO, {})
end

vim.keymap.set('n', '<leader>r', M.reload)
