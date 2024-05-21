return {
	{
		--"PinpongTp/comic",
		dir = "~/Developer/theme/vim/comic",
		--dir = "~/Developer/my/comic",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("comic")
		end,
	},
	{
		"tomasr/molokai",

		config = function()
			--vim.cmd.colorscheme("molokai")
		end,
	},
	{
		"folke/tokyonight.nvim",

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
			--[[vim.cmd.colorscheme("tokyonight")]]
		end,
	},
	{
		"NLKNguyen/papercolor-theme",

		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("PaperColor")
		end,
	},
	{
		"PinpongTp/eva01.vim",

		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("eva01")
		end,
	},
	{
		"pgdouyon/vim-yin-yang",

		config = function()
			--vim.cmd.colorscheme("yin")
		end,
	},
	{
		"catppuccin/nvim",

		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				style = {
					comments = { "italic" },
				},
				integrations = {
					cmp = true,
					nvimtree = true,
					indent_blankline = { enabled = true, colored_indent_levels = false },
				},
			})
			--require("catppuccin").compile()
			--vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "patstockwell/vim-monokai-tasty" },
	{ "dracula/vim", name = "dracula" },
	{ "axvr/photon.vim" },
	{ "preservim/vim-colors-pencil" },
}
