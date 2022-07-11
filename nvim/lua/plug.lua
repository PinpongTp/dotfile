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
if not ok then
  return
end

-- init packer
packer.init {display = {show_all_info = true, prompt_border = 'double'}}

-- start up --
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- theme
  use {'dracula/vim', as = 'dracula'}
  use 'kyazdani42/nvim-web-devicons'

  -- nerdtree
  use 'preservim/nerdtree'
  use 'xuyuanp/nerdtree-git-plugin'
  -- status bar
  use 'hoob3rt/lualine.nvim'
  -- buffer
  use 'kdheepak/tabline.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'

  -- lap > cmp
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/plenary.nvim'

  -- commenter
  use 'preservim/nerdcommenter'

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'simrat39/symbols-outline.nvim'
  use 'SmiteshP/nvim-navic'
  use 'nvim-lua/completion-nvim'

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
	use 'cohama/lexima.vim'

  -- helper
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'akinsho/toggleterm.nvim'
  use 'folke/which-key.nvim'
end)

