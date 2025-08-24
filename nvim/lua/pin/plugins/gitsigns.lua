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
		keymap.set("n", ";gS", ":Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
		keymap.set("n", ";gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
		keymap.set("n", ";gR", ":Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
		keymap.set("n", ";gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
		keymap.set("n", ";gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
		keymap.set("n", "<C-g>", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
		keymap.set("n", ";gB", ':lua require"gitsigns".blame_line{full=true}<CR>', { desc = "Blame line full" })
		keymap.set("n", ";gd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
		keymap.set("n", ";gD", ':lua require"gitsigns".diffthis("~")<CR>', { desc = "Diff this full" })
		keymap.set("n", ";tb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle blame" })
		keymap.set("n", ";td", ":Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

		-- Text object
		keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
		keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
	end,
}
