return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = { enable_autocmd = false },
		},
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		---@diagnostic disable-next-line: missing-fields
		comment.setup({
			keybindings = {
				basic = true,
				extra = true,
			},
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
