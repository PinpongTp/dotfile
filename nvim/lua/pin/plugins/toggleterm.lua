return {
	"akinsho/toggleterm.nvim",
	config = function()
		tg = require("toggleterm")

		tg.setup({
			open_mapping = [[<c-x>]],
			shade_terminals = true,
			close_on_exit = true,
			direction = "float",
			float_opts = {
				border = "curved",
				whiblend = 0,
				highlights = { border = "Normal", backgroud = "Normal" },
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			env = {
				NVIM = vim.v.servername, -- สำคัญ: ทำให้ lazygit ยิงกลับเข้า nvim instance เดิมได้
			},
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		local keymap = vim.keymap

		keymap.set("n", ";tg", "<Cmd>lua _lazygit_toggle()<CR>", { desc = "Lazygit" })
		keymap.set("n", "<c-z>", ":ToggleTerm direction=horizontal<CR>", { desc = "Zoom" })
	end,
}
