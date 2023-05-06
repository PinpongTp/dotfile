-- start up --
return {
	-- for tmux navigator
	{ "christoomey/vim-tmux-navigator" },
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("smart-splits").setup({
				resize_mode = {
					quit_key = "q",
				},
			})
		end,
	},

	-- theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1001,
		config = function()
			-- load tho colorsheme here
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				transparent_sidebar = true,
				dim_inactive = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{ "patstockwell/vim-monokai-tasty" },
	{ "dracula/vim", priority = 1000, name = "dracula" },
	{ "axvr/photon.vim" },
	{ "preservim/vim-colors-pencil" },

	-- show color
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- rest client
	{
		"NTBBloodbath/rest.nvim",
		config = function()
			require("rest-nvim").setup()
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
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

	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "nvimdev/lspsaga.nvim" },
			{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
			{ "onsails/lspkind-nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- LSP Support
			{ "j-hui/fidget.nvim" },
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
			},

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					-- check what is this
					"rafamadriz/friendly-snippets", -- Optional
				},
			}, -- Required
		},
	},

	-- debuger
	--{
	--"jay-babu/mason-nvim-dap.nvim",
	--priority = 899,
	--config = function()
	--require("mason-nvim-dap").setup({
	--automatic_setup = true,
	--})
	--end,
	--},
	{
		"rcarriga/nvim-dap-ui",
		priority = 898,
		dependencies = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugin_configs.dap.dap")
		end,
	},

	--'hrsh7th/cmp-cmdline',
	--'f3fora/cmp-spell',
	--'hrsh7th/cmp-calc',
	--'ray-x/cmp-treesitter',
	--'uga-rosa/cmp-dictionary',

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
	{

		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({
				keymaps = {
					hover_symbol = "K",
					--toggle_preview = "",
					-- TODO: update pluging and check preview function
				},
			})
		end,
	},
	"nvim-lua/completion-nvim",

	--"mfussenegger/nvim-dap",
	--"nvim-telescope/telescope-dap.nvim",
	--"theHamsta/nvim-dap-virtual-text",
	--"rcarriga/nvim-dap-ui",

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
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
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
	{ "folke/which-key.nvim", lazy = false },
	"kshenoy/vim-signature",
	"lukas-reineke/indent-blankline.nvim", -- indentline

	-- commenter
	"preservim/nerdcommenter",
	"folke/todo-comments.nvim",

	-- language
	-- go
	"fatih/vim-go",
	-- csv
	--[[{
		"mechatroner/rainbow_csv",
		config = function()
			vim.cmd([[
        autocmd BufNewFile,BufRead *.csv   set filetype=csv_pipe
			  let g:rcsv_colorpairs = [['NONE', 'NONE'], ['NONE', 'NONE'], ['yellow', 'yellow'],['NONE', 'NONE'], ['NONE', 'NONE'], ['cyan', 'cyan'], ['NONE', 'NONE'], ['NONE', 'NONE'], ['yellow', 'yellow'],]
      <])
		end,
	},]]

	"tyru/open-browser.vim",
	"weirongxu/plantuml-previewer.vim",

	-- list for research
	--"andymass/vim-matchup",
	--"ray-x/lsp_signature.nvim",
	--"Wansmer/treesj"
}
