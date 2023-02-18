-- start up --
return {
	-- for tmux navigator
	"christoomey/vim-tmux-navigator",

	-- theme
	{
		"folke/tokyonight.nvim",
		priority = 1001,
		config = function()
			-- load tho colorsheme here
			vim.cmd([[colorscheme tokyonight]])
			require("tokyonight").setup({
				style = "night",
				transparent = true,
			})
		end,
	},
	{ "patstockwell/vim-monokai-tasty" },

	{ "dracula/vim", priority = 1000, name = "dracula" },
	{ "axvr/photon.vim" },
	{ "tckmn/hotdog.vim" },
	{ "preservim/vim-colors-pencil" },

	-- show color
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- rest client
	--'NTBBloodbath/rest.nvim',
	--use { 'PinpongTp/rest.nvim', branch = 'main' }
	--'~/Developer/my/nvim/plugins/rest.nvim',

	-- landing page
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- zen mode
	"preservim/vim-markdown",
	"folke/zen-mode.nvim",
	"junegunn/limelight.vim",

	-- nvimtree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	-- status bar
	"hoob3rt/lualine.nvim",
	-- buffer
	"kdheepak/tabline.nvim",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "tami5/lspsaga.nvim" },
			{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
			{ "onsails/lspkind-nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},

	-- lsp
	--'neovim/nvim-lspconfig',
	--'williamboman/nvim-lsp-installer',
	--'tami5/lspsaga.nvim',
	--'folke/lsp-colors.nvim',
	-- lap > cmp

	--'L3MON4D3/LuaSnip',
	-- completion
	--{
	--'hrsh7th/nvim-cmp',
	--dependencies = {
	--'hrsh7th/cmp-buffer',
	--'hrsh7th/cmp-nvim-lsp',
	--'hrsh7th/cmp-path',
	--'hrsh7th/cmp-cmdline',
	--'hrsh7th/cmp-nvim-lua',
	--'f3fora/cmp-spell',
	--'hrsh7th/cmp-calc',
	--'ray-x/cmp-treesitter',
	--'uga-rosa/cmp-dictionary',
	--'saadparwaiz1/cmp_luasnip',
	--},
	--},
	--'onsails/lspkind-nvim',
	"nvim-lua/plenary.nvim",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground", -- TD: maybe not use

			-- tab and fold
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag", -- setup in treesitter
			"tpope/vim-surround",
		},
	},
	"simrat39/symbols-outline.nvim",
	"SmiteshP/nvim-navic",
	"nvim-lua/completion-nvim",

	-- debuger
	"mfussenegger/nvim-dap",
	"nvim-telescope/telescope-dap.nvim",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",

	-- for move
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup()
		end,
	},

	-- telescope
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	-- for use format and eslint
	"jose-elias-alvarez/null-ls.nvim",
	"eslint/eslint",

	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- helper
	"akinsho/toggleterm.nvim",
	"voldikss/vim-floaterm",
	"folke/which-key.nvim",
	"kshenoy/vim-signature",
	"lukas-reineke/indent-blankline.nvim", -- indentline

	-- commenter
	"preservim/nerdcommenter",
	"folke/todo-comments.nvim",

	-- language
	"fatih/vim-go",

	"tyru/open-browser.vim",
	"weirongxu/plantuml-previewer.vim",
}
