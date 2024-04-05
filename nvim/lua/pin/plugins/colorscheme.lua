return {
	{
		--"PinpongTp/comic",
		--dir = "~/Developer/theme/vim/comic",
		dir = "~/Developer/my/comic",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("comic")
		end,
	},
}
