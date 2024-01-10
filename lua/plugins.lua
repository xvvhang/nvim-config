local plugins = {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    keys = require('plugins.nvim-tree').keys,
    opts = require('plugins.nvim-tree').opts
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    keys = require('plugins.bufferline').keys,
    opts = require('plugins.bufferline').opts
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
      {
        'zbirenbaum/copilot.lua',
        config = function() require('copilot').setup() end
      },
    },
    event = "VeryLazy",
    opts = require('plugins.lualine').opts
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = require('plugins.telescope').keys,
    opts = require('plugins.telescope').opts
  },
  { 'kevinhwang91/nvim-bqf' },
  -- LANGUAGE
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
      {
        'windwp/nvim-autopairs',
        opts = { map_cr = true }
      },
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    build = ':TSInstall',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts = require('plugins.nvim-treesitter').opts,
    config = function(_, opts) require('plugins.nvim-treesitter').config(opts) end
  },
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    cmd = 'Mason',
    opts = require('plugins.mason').opts
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    lazy = false,
    config = function() require('plugins.nvim-lspconfig').config() end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
      'rafamadriz/friendly-snippets',
      {
        'zbirenbaum/copilot.lua',
        config = function() require('copilot').setup() end
      },
      {
        'zbirenbaum/copilot-cmp',
        config = function() require('copilot_cmp').setup() end
      }
    },
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = require('plugins.nvim-cmp').opts,
    config = function(_, opts) require('plugins.nvim-cmp').config(opts) end
  },
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = require('plugins.comment').opts
  },
  -- WORKFLOW
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = require('plugins.gitsigns').opts
  },
  {
    'zbirenbaum/copilot.lua',
    lazy = false,
    config = function() require('copilot').setup() end
  },
  -- UTILS
  {
    'mrjones2014/smart-splits.nvim',
    config = function() require('plugins.smart-splits').config() end
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  },
  -- APPERANCE
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    opts = require('plugins.indent-blankline').opts
  },
  {
    'stevearc/dressing.nvim',
    lazy = false
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end
  }
}

local configs = {
  ui = {
    size = { width = 0.5 },
    title = ' Lazy ',
    border = 'rounded',
  }
}

local path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    path,
  })
end
vim.opt.rtp:prepend(path)

local lazy = require('lazy')

lazy.setup(plugins, configs)
