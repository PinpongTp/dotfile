return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup()
	end,
	keys = {
		-- Toggle Claude Code terminal
		{ "<Leader>l", "<cmd>ClaudeCode<CR>", mode = "n", desc = "Toggle Claude Code" },
		{ "<Leader>l", "<cmd>ClaudeCode<CR>", mode = "t", desc = "Toggle Claude Code" },
		-- Variant modes
		{ "<leader>L", "<cmd>ClaudeCode --continue<CR>", mode = "n", desc = "Toggle Claude Code (continue)" },
		{ "<leader>cV", "<cmd>ClaudeCode --verbose<CR>", mode = "n", desc = "Toggle Claude Code (verbose)" },
		-- Terminal navigation
		{ "<Leader>Sh", "<cmd>wincmd h<CR>", mode = "t", desc = "Navigate left" },
		{ "<Leader>Sj", "<cmd>wincmd j<CR>", mode = "t", desc = "Navigate down" },
		{ "<Leader>Sk", "<cmd>wincmd k<CR>", mode = "t", desc = "Navigate up" },
		{ "<Leader>Sl", "<cmd>wincmd l<CR>", mode = "t", desc = "Navigate right" },
		{ "<Leader>Sf", "<C-\\><C-n><C-f>", mode = "t", desc = "Scroll full-page down" },
		{ "<Leader>Sb", "<C-\\><C-n><C-b>", mode = "t", desc = "Scroll full-page up" },
	},
}
