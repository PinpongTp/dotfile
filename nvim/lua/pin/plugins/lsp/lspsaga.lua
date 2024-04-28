return {
	"nvimdev/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			ui = {
				title = true,
				border = "single",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "",
				incoming = " ",
				outgoing = " ",
				hover = "",
				kind = {},
				colors = {
					normal_bh = "NONE",
				},
			},
			symbol_in_winbar = {
				enable = false,
			},
			beacon = {
				enable = false,
			},
			outline = {
				layout = "normal",
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>") --  get help
		-- keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
		keymap.set({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>", { desc = "Code action" })
		keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>", { desc = "Rename" })
		keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" }) -- prev error or warning
		keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" }) -- next error or warning
		keymap.set("n", "[E", function() -- prev error
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "Previous error" })
		keymap.set("n", "]E", function() -- next error
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "Next error" })
	end,
}
