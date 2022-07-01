local M = {};

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

M.startup = function()
  require('packer').reset()

  require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'christoomey/vim-tmux-navigator'

    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-vinegar'
    use 'pbrisbin/vim-mkdir'
    use 'LnL7/vim-nix'

    use { 'nvim-lua/plenary.nvim' }

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

    use 'neovim/nvim-lspconfig'

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'onsails/lspkind.nvim' },
      }
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    use 'tpope/vim-endwise'

     use {
       'windwp/nvim-autopairs',
       config = function()
         require('nvim-autopairs').setup{}
       end
     }

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
end

M.sync = require('packer').sync

return M;