require("ibl").setup({
	enabled = false,
	indent = {
		char = "▏",
		--highlight = { "IndentGuide", "VertSplit" },
		smart_indent_cap = true,
	},
	scope = {
		enabled = true,
		show_start = true,
		show_end = true,
		show_exact_scope = true, -- tbc
		--highlight = { "IndentGuideOdd" },
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},
})
