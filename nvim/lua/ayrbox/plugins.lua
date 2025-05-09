-- Plugins are stored here in case you need fresh one delete everything here ~/.local/share/nvim/site/pack/packer

local fn = vim.fn

-- Automatically Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  print "Installing packer restart Neovim..."
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("No packer found")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
packer.startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
    {'j-hui/fidget.nvim', tag = "legacy"},

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Colorschemes
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'f-person/git-blame.nvim' -- Git Blame https://github.com/f-person/git-blame.nvim


  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use {'lukas-reineke/indent-blankline.nvim', main="ibl", opts={}} -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim'               -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automatically

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  } 

  use {
    "ThePrimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Buffer Tabs
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  -- Prettier
  -- use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use("stevearc/conform.nvim")

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use 'tjdevries/present.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if is_bootstrap then
    require("packer").sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
