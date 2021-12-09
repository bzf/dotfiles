vim.g.mapleader = ' '

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n', '<leader>ve', ':edit $HOME/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vE', ':tabedit $HOME/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':source $HOME/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>w', ':write<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':quit<CR>', { noremap = true, silent = true })

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

require('packer').startup(function()
  use 'christoomey/vim-tmux-navigator'

  use 'wbthomason/packer.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'pbrisbin/vim-mkdir'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }},
    config = function()
      vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })

      function find_dotfile()
        require("telescope.builtin").find_files({
          cwd = "~/.dotfiles/",
        })
      end

      vim.api.nvim_set_keymap('n', '<leader>td', [[<cmd>lua find_dotfile()<CR>]], { noremap = true, silent = true })
    end
  }

  use {
    'tpope/vim-fugitive', 
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
    end
  }

  use {
    'morhetz/gruvbox',
    config = function()
      vim.cmd[[colorscheme gruvbox]]
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
