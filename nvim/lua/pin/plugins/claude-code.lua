return {
	"coder/claudecode.nvim",
	dependencies = {
		{
			"folke/snacks.nvim",
			keys = {
				-- { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "t" },
				-- { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "t" },
			},
		},
	},
	opts = {
		terminal = {
			snacks_win_opts = {
				keys = {
					nav_h = {
						"<C-h>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateLeft")
						end,
						mode = "t",
						desc = "Navigate left",
					},
					nav_j = {
						"<C-j>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateDown")
						end,
						mode = "t",
						desc = "Navigate down",
					},
					nav_k = {
						"<C-k>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateUp")
						end,
						mode = "t",
						desc = "Navigate up",
					},
					nav_l = {
						"<C-l>",
						function()
							vim.cmd("stopinsert")
							vim.cmd("TmuxNavigateRight")
						end,
						mode = "t",
						desc = "Navigate right",
					},
					esc = { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
				},
			},
		},
	},
	config = true,
	lazy = false,
	keys = {
		{ "<leader>l", nil, desc = "AI/Claude Code" },
		{
			"<leader>ll",
			function()
				vim.cmd("ClaudeCode")
			end,
			desc = "Toggle Claude",
		},
		{
			"<leader>lf",
			function()
				vim.cmd("ClaudeCodeFocus")
			end,
			desc = "Focus Claude",
		},
		{
			"<leader>lr",
			function()
				vim.cmd("ClaudeCode --resume")
			end,
			desc = "Resume Claude",
		},
		{
			"<leader>lc",
			function()
				vim.cmd("ClaudeCode --continue")
			end,
			desc = "Continue Claude",
		},
		{
			"<leader>lm",
			function()
				vim.cmd("ClaudeCodeSelectModel")
			end,
			desc = "Select Claude model",
		},
		{
			"<leader>lb",
			function()
				vim.cmd("ClaudeCodeAdd %")
			end,
			desc = "Add current buffer",
		},
		{
			"<leader>ls",
			function()
				vim.cmd("ClaudeCodeSend")
			end,
			mode = "v",
			desc = "Send to Claude",
		},
		{
			"<leader>ls",
			function()
				vim.cmd("ClaudeCodeTreeAdd")
			end,
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{
			"<leader>la",
			function()
				vim.cmd("ClaudeCodeDiffAccept")
			end,
			desc = "Accept diff",
		},
		{
			"<leader>ld",
			function()
				vim.cmd("ClaudeCodeDiffDeny")
			end,
			desc = "Deny diff",
		},
	},
}
