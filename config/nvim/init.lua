vim.g.mapleader = ' '

vim.opt.grepprg = "rg --vimgrep"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.autowrite = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.ale_linters = {ruby = {'standardrb'}, elm = {'elm_ls'}}
vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  ruby = {'standardrb'},
  rust = {'rustfmt'},
  elm = {'elm-format'},
  typescript = {'prettier'},
  typescriptreact = {'prettier'}
}

vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1

vim.api.nvim_set_keymap('n', '<leader>vs', ':source $HOME/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':write<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':quit<CR>', { noremap = true, silent = true })

require('bzf')
