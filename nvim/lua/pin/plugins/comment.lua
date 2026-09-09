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

		local ts_pre_hook = ts_context_commentstring.create_pre_hook()

		---@diagnostic disable-next-line: missing-fields
		comment.setup({
			keybindings = {
				basic = true,
				extra = true,
			},
			-- Returning nil here lets Comment.nvim fall back to its own treesitter
			-- lookup, which breaks on Neovim 0.12 for filetypes without a parser
			-- (vim.treesitter.get_parser returns nil instead of erroring, so
			-- Comment/ft.lua indexes a nil tree). Resolve the commentstring here
			-- instead so that path is never reached.
			pre_hook = function(ctx)
				local ok, cstr = pcall(ts_pre_hook, ctx)
				if ok and cstr then
					return cstr
				end
				return require("Comment.ft").get(vim.bo.filetype, ctx.ctype) or vim.bo.commentstring
			end,
		})
	end,
}
