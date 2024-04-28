return {
	"phaazon/hop.nvim",
	branch = "v2",
	event = "VeryLazy",
	config = function()
		require("hop").setup()

		local keymap = vim.keymap
		--keymap.set("n", "<Leader>ff", ":HopChar1<CR>", { desc = "Hop to char" })
		keymap.set("n", "<Leader>fF", ":HopPattern<CR>", { desc = "Hop to pattern" })
		keymap.set("n", "<Leader>fL", ":HopLine<CR>", { desc = "Hop to line" })
		keymap.set("n", "<Leader>fw", ":HopWord<CR>", { desc = "Hop to word" })
		keymap.set("n", "<Leader>fh", ":HopVertical<CR>", { desc = "Hop to vertical" })
		keymap.set("n", "F", ":HopChar1<CR>", { desc = "Hop to char" })
	end,
}
