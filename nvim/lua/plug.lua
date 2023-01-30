local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- start up --
require('lazy').setup({
  -- for tmux navigator
  'christoomey/vim-tmux-navigator',

  -- theme
  { 'dracula/vim', name = 'dracula' },
  'axvr/photon.vim',
  'tckmn/hotdog.vim',
  'fenetikm/falcon',
  'rafi/awesome-vim-colorschemes',
  { 'preservim/vim-colors-pencil' },
  'norcalli/nvim-colorizer.lua',

  -- rest client
  'NTBBloodbath/rest.nvim',
  --use { 'PinpongTp/rest.nvim', branch = 'main' }
  --'~/Developer/my/nvim/plugins/rest.nvim',

  -- landing page
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  -- zen mode
  'preservim/vim-markdown',
  'folke/zen-mode.nvim',
  'junegunn/limelight.vim',

  -- nvimtree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    },
  },
  -- status bar
  'hoob3rt/lualine.nvim',
  -- buffer
  'kdheepak/tabline.nvim',

  -- lsp
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'tami5/lspsaga.nvim',
  'folke/lsp-colors.nvim',
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  -- lap > cmp


  'L3MON4D3/LuaSnip',
  -- completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      --'hrsh7th/cmp-cmdline',
      --'hrsh7th/cmp-nvim-lua',
      --'f3fora/cmp-spell',
      --'hrsh7th/cmp-calc',
      --'ray-x/cmp-treesitter',
      --'uga-rosa/cmp-dictionary',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  'onsails/lspkind-nvim',
  'nvim-lua/plenary.nvim',

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/playground', -- TD: maybe not use
  'simrat39/symbols-outline.nvim',
  'SmiteshP/nvim-navic',
  'nvim-lua/completion-nvim',

  -- debuger
  'mfussenegger/nvim-dap',
  'nvim-telescope/telescope-dap.nvim',
  'theHamsta/nvim-dap-virtual-text',
  'rcarriga/nvim-dap-ui',

  -- for move
  { 'phaazon/hop.nvim', branch = 'v2' },

  -- telescope
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  -- for use format and eslint
  'jose-elias-alvarez/null-ls.nvim',
  'eslint/eslint',

  -- git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- helper
  'akinsho/toggleterm.nvim',
  'voldikss/vim-floaterm',
  'folke/which-key.nvim',
  'kshenoy/vim-signature',
  "lukas-reineke/indent-blankline.nvim", -- indentline

  -- commenter
  'preservim/nerdcommenter',
  "folke/todo-comments.nvim",

  -- tab and fold
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag', -- setup in treesitter
  'tpope/vim-surround',

  -- language
  'fatih/vim-go',

  'tyru/open-browser.vim',
  'weirongxu/plantuml-previewer.vim'

})
