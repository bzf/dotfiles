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
    'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require('lspconfig')

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      end

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      local servers = { 'rust_analyzer', 'solargraph', 'tsserver' }

      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150,
          }
        }
      end
    end
  }

  use 'hrsh7th/vim-vsnip'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip' },
    },
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable,
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['solargraph'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['tsserver'].setup {
        capabilities = capabilities
      }
    end
  }

  use { 'dense-analysis/ale' }

  use {
    'numToStr/Comment.nvim',
    tag = 'v0.6',
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
