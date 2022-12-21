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

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = function()
        vim.keymap.set('n', '<C-p>', function()
          require('telescope.builtin').git_files { show_untracked = true }
        end, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { noremap = true, silent = true })

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

    use 'L3MON4D3/LuaSnip'

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
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = false },
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', '<leader>hb', function() gs.blame_line{full=true} end)
            map('n', '<leader>tb', gs.toggle_current_line_blame)
            map('n', '<leader>td', gs.toggle_deleted)
          end
        }
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

M.sync = function()
  require('packer').sync()
  require('packer').compile()
end

return M;
