return {
	"olimorris/codecompanion.nvim",
	-- Test with local version (delete if not required)
	-- dir = "~/Code/Neovim/codecompanion.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			build = ":TSUpdate",
		},

		-- Test with blink.cmp
		{
			"saghen/blink.cmp",
			version = "1.*",
			opts = {
				keymap = {
					preset = "enter",
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
				},
				cmdline = { sources = { "cmdline" } },
				sources = {
					default = { "lsp", "path", "buffer" },
				},
			},
		},

		-- Or, test with nvim-cmp
		-- { "hrsh7th/nvim-cmp" },
	},
	opts = {
		--Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
		interactions = {
			chat = { adapter = "copilot" },
			inline = { adapter = "copilot" },
		},

		display = {
			chat = {
				window = {
					layout = "vertical", -- หรือ horizontal / float
				},
				smart_resize = true, -- 👈 เปิด SmartResizeMode
			},
		},
		opts = {
			log_level = "DEBUG",
		},
	},
	keys = {
		{ "<leader>C", "<cmd>CodeCompanionChat<CR>", desc = "Open CodeCompanion Chat" },
	},
}
