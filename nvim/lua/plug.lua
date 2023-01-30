-- check and load packer to --
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- load packer
local ok, packer = pcall(require, "packer")
if not ok then return end
packer.init {
  display = {
    open_fn = require('packer.util').float,
    show_all_info = true,
    prompt_border = 'double'
  }
}

-- start up --
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- for tmux navigator
  use 'christoomey/vim-tmux-navigator'

  -- theme
  use { 'dracula/vim', as = 'dracula' }
  use 'axvr/photon.vim'
  use 'tckmn/hotdog.vim'
  use 'fenetikm/falcon'
  use 'rafi/awesome-vim-colorschemes'
  use { 'preservim/vim-colors-pencil' }
  use 'norcalli/nvim-colorizer.lua'

  -- rest client
  use 'NTBBloodbath/rest.nvim'
  --use { 'PinpongTp/rest.nvim', branch = 'main' }
  --use '~/Developer/my/nvim/plugins/rest.nvim'

  -- landing page
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- zen mode
  use 'preservim/vim-markdown'
  use 'folke/zen-mode.nvim'
  use 'junegunn/limelight.vim'

  -- nvimtree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
  }
  -- status bar
  use 'hoob3rt/lualine.nvim'
  -- buffer
  use 'kdheepak/tabline.nvim'


  -- mason
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  -- lap > cmp

  -- debuger
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'

  use 'L3MON4D3/LuaSnip'
  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
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
  }
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/plenary.nvim'

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground' -- TD: maybe not use
  use 'simrat39/symbols-outline.nvim'
  use 'SmiteshP/nvim-navic'
  use 'nvim-lua/completion-nvim'


  -- for move
  use { 'phaazon/hop.nvim', branch = 'v2' }

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- for use format and eslint
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'eslint/eslint'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

  -- helper
  use 'akinsho/toggleterm.nvim'
  use 'voldikss/vim-floaterm'
  use 'folke/which-key.nvim'
  use 'kshenoy/vim-signature'
  use "lukas-reineke/indent-blankline.nvim" -- indentline

  -- commenter
  use 'preservim/nerdcommenter'
  use "folke/todo-comments.nvim"

  -- tab and fold
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' -- setup in treesitter
  use 'tpope/vim-surround'

  -- language
  use 'fatih/vim-go'

  use 'tyru/open-browser.vim'
  use 'weirongxu/plantuml-previewer.vim'

end)
