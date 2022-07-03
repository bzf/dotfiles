local M = {}

require('bzf.packages').startup()
require('bzf.snippets').configure()
require('bzf.completion').configure()
require('bzf.lsp').configure()
require('bzf.statusline').configure()

M.reload = function()
  require('plenary.reload').reload_module('bzf')
  require('bzf')

  require('bzf.packages').startup()
  require('bzf.snippets').configure()
  require('bzf.completion').configure()
  require('bzf.lsp').configure()
  require('bzf.statusline').configure()

  vim.notify("module bzf reloaded!", vim.log.levels.INFO, {})
end

M.sync = function()
  require('bzf.packages').sync()
end

vim.keymap.set('n', '<leader>vr', M.reload)
vim.keymap.set('n', '<leader>vs', M.sync)
