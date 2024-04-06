return {
	"tpope/vim-fugitive",
	config = function()
		local status, fugitive = pcall(require, "tpope/vim-fugitive")
		if not status then
			return
		end

		fugitive.setup({})

		local keymap = vim.keymap

		keymap.set("n", ";gm", ":Git blame<CR>", { desc = "" })
	end,
}
