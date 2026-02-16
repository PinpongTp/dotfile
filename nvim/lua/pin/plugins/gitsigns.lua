return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		trouble = true,
	},
	keys = {
		-- Navigation
		{
			"]c",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					require("gitsigns").next_hunk()
				end
			end,
			desc = "Next Hunk",
		},
		{
			"[c",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					require("gitsigns").prev_hunk()
				end
			end,
			desc = "Prev Hunk",
		},
		-- Actions
		{
			";gs",
			":Gitsigns stage_hunk<CR>",
			desc = "Stage Hunk",
			mode = { "n", "v" },
		},
		{
			";gr",
			":Gitsigns reset_hunk<CR>",
			desc = "Reset Hunk",
			mode = { "n", "v" },
		},
		{
			";gS",
			":Gitsigns stage_buffer<CR>",
			desc = "Stage Buffer",
		},
		{
			";gu",
			":Gitsigns undo_stage_hunk<CR>",
			desc = "Undo Stage Hunk",
		},
		{
			";gR",
			":Gitsigns reset_buffer<CR>",
			desc = "Reset Buffer",
		},
		{
			";gp",
			":Gitsigns preview_hunk<CR>",
			desc = "Preview Hunk",
		},
		{
			";gb",
			":Gitsigns blame_line<CR>",
			desc = "Blame Line",
		},
		{
			"<C-g>",
			":Gitsigns blame_line<CR>",
			desc = "Blame Line",
		},
		{
			";gB",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Blame Line (Full)",
		},
		{
			";gd",
			":Gitsigns diffthis<CR>",
			desc = "Diff This",
		},
		{
			";gD",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "Diff This (Full)",
		},
		{
			";tb",
			":Gitsigns toggle_current_line_blame<CR>",
			desc = "Toggle Blame",
		},
		{
			";td",
			":Gitsigns toggle_deleted<CR>",
			desc = "Toggle Deleted",
		},
		-- Text object
		{
			"ih",
			":<C-U>Gitsigns select_hunk<CR>",
			desc = "Select Hunk",
			mode = { "o", "x" },
		},
	},
}
