return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			"F",
			mode = { "n", "o" },
			function()
				require("flash").jump({ search = { mode = "search" }, label = { after = { 0, 0 } } })
			end,
			desc = "Flash Search",
		},
	},
}
