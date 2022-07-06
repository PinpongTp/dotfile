if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" git command in vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'


if has("nvim")
  " nerd tree
  Plug 'preservim/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'folke/which-key.nvim'
  "Plug 'majutsushi/tagbar'
  "Plug 'preservim/tagbar'
  " tmux line
  "Plug 'edkolev/tmuxline.vim'
  " commenter
  Plug 'preservim/nerdcommenter'
  " status bar
  Plug 'hoob3rt/lualine.nvim'
  " buffer
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } 
  Plug 'kdheepak/tabline.nvim'
  " Plug 'romgrk/barbar.nvim'
  " defx look like nerdtree
  "Plug 'kristijanhusak/defx-git'
  "Plug 'kristijanhusak/defx-icons'
  "Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  " lap > cmp
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'SmiteshP/nvim-navic'
  "Plug 'SmiteshP/nvim-gps'
  Plug 'nvim-lua/completion-nvim'
  " icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  " telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  " Git status
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }

  " for use format and eslint
  Plug 'jose-elias-alvarez/null-ls.nvim'
  "Plug 'MunifTanjim/prettier.nvim'
  Plug 'eslint/eslint'

  "Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

endif

"Plug 'groenewege/vim-less', { 'for': 'less' }
"Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
