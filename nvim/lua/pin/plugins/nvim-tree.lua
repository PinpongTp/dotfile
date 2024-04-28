return {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = false,
        width = 35,
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
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle file explerer"})
    keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file explerer on current buffer"})
    keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse file explorer"})
    keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh file explorer"})

    keymap.set("n", "<Leader>m", ":NvimTreeFindFileToggle<CR>", { noremap = false, silent = true })
    keymap.set("n", "<Leader>N", ":NvimTreeFindFile<CR>", { noremap = false, silent = true })
  end
}
