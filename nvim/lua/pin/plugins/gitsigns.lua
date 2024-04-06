return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			trouble = true,
		})

		local keymap = vim.keymap
		keymap.set("n", ";ti", ":IBLToggle<CR>", { desc = "Toggle indent" })

		-- Navigation
		keymap.set("n", "]c", "&diff ? ']c' : ':Gitsigns next_hunk<CR>'", { expr = true })
		keymap.set("n", "[c", "&diff ? '[c' : ':Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		keymap.set("n", ";gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
		keymap.set("v", ";gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
		keymap.set("n", ";gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
		keymap.set("v", ";gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
		keymap.set("n", ";gS", ":Gitsigns stage_buffer<CR>")
		keymap.set("n", ";gu", ":Gitsigns undo_stage_hunk<CR>")
		keymap.set("n", ";gR", ":Gitsigns reset_buffer<CR>")
		keymap.set("n", ";gp", ":Gitsigns preview_hunk<CR>")
		keymap.set("n", ";gb", ":Gitsigns blame_line<CR>")
		keymap.set("n", "<C-g>", ":Gitsigns blame_line<CR>")
		keymap.set("n", ";gB", ':lua require"gitsigns".blame_line{full=true}<CR>')
		keymap.set("n", ";gd", ":Gitsigns diffthis<CR>")
		keymap.set("n", ";gD", ':lua require"gitsigns".diffthis("~")<CR>')
		keymap.set("n", ";tb", ":Gitsigns toggle_current_line_blame<CR>")
		keymap.set("n", ";td", ":Gitsigns toggle_deleted<CR>")

		-- Text object
		keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
		keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")

		-- map("n", ";gm", ":Git blame<CR>", opts)
	end,
}
