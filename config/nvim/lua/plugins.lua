return require('packer').startup(function()
  use 'bzf/vim-concentric-sort-motion'
  use 'chriskempson/base16-vim'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'dense-analysis/ale'
  use 'janko-m/vim-test'
  use 'mattn/emmet-vim'
  use 'mustache/vim-mustache-handlebars'
  use 'neovim/nvim-lspconfig'
  use 'pangloss/vim-javascript'
  use 'pbrisbin/vim-mkdir'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'wbthomason/packer.nvim'

  use {
    'junegunn/fzf.vim',
    requires = {{ 'junegunn/fzf' }}
  }

  use {
    'kana/vim-textobj-user',
    requires = {{ 'kana/vim-textobj-indent' }}
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "ruby", "javascript", "typescript", "css", "scss" },
        ignore_install = {},
        highlight = {
          enable = true,
        },
      }
    end
  }
end)
