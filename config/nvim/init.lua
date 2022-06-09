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

vim.g.ale_linters = {ruby = {'standardrb'}}
vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  ruby = {'standardrb'},
  rust = {'rustfmt'},
  typescript = {'prettier'},
  typescriptreact = {'prettier'}
}

vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1

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

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'pbrisbin/vim-mkdir'
  use 'LnL7/vim-nix'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'kana/vim-textobj-indent',
    requires = {
      { 'kana/vim-textobj-user' },
    },
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }},
    config = function()
      vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

      function find_dotfile()
        require("telescope.builtin").find_files({
          cwd = "~/.dotfiles/",
        })
      end

      vim.api.nvim_set_keymap('n', '<leader>ve', [[<cmd>lua find_dotfile()<CR>]], { noremap = true, silent = true })

      require('telescope').load_extension('fzf')
    end
  }

  use {
    'vim-test/vim-test',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>ta', ":TestSuite<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tl', ":TestLast<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tt', ":TestNearest<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tT', ":TestFile<CR>", { noremap = true, silent = true })
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = "release",
    config = function()
      vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })
    end
  }

  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-endwise'

  use { 'dense-analysis/ale' }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
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
