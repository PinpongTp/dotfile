return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		left = {
			{
				ft = "NvimTree",
				open = "NvimTreeOpen",
			},
			{
				ft = "Outline",
				open = "SymbolsOutlineOpen",
			},
			{
				ft = "NavBuddy",
				open = "Navbuddy",
			},
		},
		bottom = {},
		right = {},
		top = {},
		options = {
			left = { size = 35 },
			bottom = {},
			right = {},
			top = {},
		},
		animate = {
			enabled = false,
		},
		exit_when_last = true,
		keys = {
			["<C-Right>"] = function(win)
				win:resize("width", 2)
			end,
			["<C-Left>"] = function(win)
				win:resize("width", -2)
			end,
			["<C-Up>"] = function(win)
				win:resize("height", 2)
			end,
			["<C-Down>"] = function(win)
				win:resize("height", -2)
			end,
		},
	},
	keys = {
		{
			"<leader>p",
			function()
				require("edgy").toggle()
			end,
			desc = "Toggle Edgy",
		},
	},
}
