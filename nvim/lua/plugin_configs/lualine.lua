local status, lualine = pcall(require, "lualine")
if (not status) then return end

local navic = require("nvim-navic")
local tabline = require("tabline")


lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    --section_separators = { left = '', right = '' },
    --component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { "NvimTree" }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diff' },
    -- lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }, { navic.get_location, cond = navic.is_available }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      } -- 'encoding',
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic", "vim_lsp" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      } -- 'encoding',
    },
    lualine_y = { 'location' },
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { tabline.tabline_buffers },
    lualine_x = { tabline.tabline_tabs },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'fugitive', 'nvim-tree' }
}

tabline.setup {
  enable = false,
  options = {
    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = true, -- shows base filename only instead of relative path in filename
    modified_icon = " ", -- change the default modified icon
    show_tabs_only = false, -- this shows only tabs instead of tabs + ffers
  }
}
-- vim.opt_local.winbar = nil
