--vim.cmd([[highlight IndentBlanklineIndent1 guifg=#333333 gui=nocombine]])

vim.cmd([[let g:indent_blankline_enabled = v:false]])

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
