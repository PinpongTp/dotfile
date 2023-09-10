local status, lualine = pcall(require, "lualine")
local icons = require("ui.icons")
if not status then
	return
end

local navic = require("nvim-navic")
local tabline = require("tabline")

ShowPath = 0
vim.api.nvim_set_keymap("n", ";ts", ":lua ToggleFileName()<CR>", { noremap = true, silent = true })
function ToggleFileName()
	if ShowPath == 0 then
		ShowPath = 1

		require("lualine").setup({
			sections = {
				lualine_b = {
					{
						"filename",
						file_status = false,
						path = ShowPath,
					},
				},
			},
		})
	else
		ShowPath = 0

		require("lualine").setup({
			sections = {
				lualine_b = {},
			},
		})
	end
end

-- loop icons and add space after each
local icons_space = {}
for k, v in pairs(icons) do
	icons_space[k] = v .. " "
end

navic.setup({
	depth_limit = 4,
	highlight = false,
	separator = " > ",
	icons = icons_space,
})

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		--section_separators = { left = '', right = '' },
		--component_separators = { left = "", right = "" },
		--section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "lspsagaoutline" },
	},
	sections = {
		-- mode
		lualine_a = {},
		-- diff
		lualine_b = {},
		lualine_c = {
			{
				"navic",
				color_correction = nil,
			},
		},
		lualine_x = {
			{
				"diff",
				diff_color = {
					added = "DiffAddedGutterLineNr",
					modified = "DiffModifiedGutterLineNr",
					removed = "DiffRemovedGutterLineNr",
				},
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				--symbols = { error = " ", warn = " ", info = " ", hint = " " },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			}, -- 'encoding',
		},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = ShowPath,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "vim_lsp" },
				--symbols = { error = " ", warn = " ", info = " ", hint = " " },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			}, -- 'encoding',
		},
		lualine_y = { "location" },
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { tabline.tabline_buffers },
		lualine_x = { tabline.tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "fugitive", "nvim-tree" },
})

tabline.setup({
	enable = false,
	options = {
		show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = true, -- shows base filename only instead of relative path in filename
		modified_icon = " ", -- change the default modified icon
		show_tabs_only = false, -- this shows only tabs instead of tabs + ffers
	},
})
-- vim.opt_local.winbar = nil
