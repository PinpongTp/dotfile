local status, tg = pcall(require, "toggleterm")
if not status then
	return
end

tg.setup({
	open_mapping = [[<c-t>]],

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
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", ";tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
