return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sort_by = "case_sensitive",
		view = {
			adaptive_size = false,
			width = 40,
			float = { enable = false },
			preserve_window_proportions = false,
		},
		renderer = {
			group_empty = true,
			highlight_git = false,
			indent_markers = {
				enable = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					none = " ",
				},
			},
			icons = {
				show = {
					folder_arrow = false,
				},
				glyphs = {
					default = "",
					symlink = "",
					bookmark = "",
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
			ignore_list = {},
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
			debounce_delay = 50,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
		},
	},
	keys = {
		{ "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
		{ "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file explorer on current buffer" },
		{ "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse file explorer" },
		{ "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh file explorer" },
		{ "<Leader>m", "<cmd>NvimTreeFindFileToggle<cr>", noremap = false, silent = true },
		{ "<Leader>N", "<cmd>NvimTreeFindFile<cr>", noremap = false, silent = true },
	},
}
