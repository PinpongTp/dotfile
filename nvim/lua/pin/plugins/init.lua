return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	-- "tyru/open-browser.vim",
	-- "weirongxu/plantuml-previewer.vim",
	{
		--"norcalli/nvim-colorizer.lua",
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({})
		end,
	},
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "140",
			scope = "file",
			disabled_filetypes = { "help", "text", "markdown", "NvimTree", "lazy", "mason", "help", "alpha" },
		},
	},
}
