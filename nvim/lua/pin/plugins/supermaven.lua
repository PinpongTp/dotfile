return {
	{
		"supermaven-inc/supermaven-nvim",
		enabled = false,
		event = "InsertEnter",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Right>",
					clear_suggestion = "<C-l>",
					accept_word = "<C-j>",
				},
				ignore_filetypes = {
					yaml = true,
					markdown = true,
					help = true,
					gitcommit = true,
					gitrebase = true,
					hgcommit = true,
					svn = true,
					cvs = true,
				},
				color = {
					suggestion_color = "#808080",
					cterm = 244,
				},
				log_level = "off",
				disable_inline_completion = false,
				disable_keymaps = false,
			})
		end,
	},
}
