return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local copilot = require("copilot")

			copilot.setup({
				panel = {
					enabled = false,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<o>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.2,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<Right>",
						next = "<C-j>",
						prev = "<C-k>",
						dismiss = "<C-l>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					javascript = true, -- allow specific filetype
					typescript = true, -- allow specific filetype
					lua = true,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
		config = function()
			require("CopilotChat").setup({
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
			})

			vim.keymap.set("n", "<leader>ccq", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, {
						selection = require("CopilotChat.select").buffer,
					})
				end
			end, { desc = "CopilotChat - Quick chat" })
		end,
		keys = {
			{
				"<leader>cc",
				"<cmd>CopilotChat<cr>",
				mode = { "n", "v" },
				desc = "Open Copilot Chat",
			},
			{
				"<leader>ca",
				"<cmd>CopilotChatActAs<cr>",
				mode = { "n", "v" },
				desc = "Open Copilot Chat Act As",
			},
			{
				"<leader>ce",
				"<cmd>CopilotChatEditWithInstructions<cr>",
				mode = { "n", "v" },
				desc = "Open Copilot Chat Edit With Instructions",
			},
		},
	},
}
