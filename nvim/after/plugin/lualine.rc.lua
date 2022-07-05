local status, lualine = pcall(require, "lualine")
if (not status) then return end

local navic = require("nvim-navic")

-- if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
-- vim.opt_local.winbar = nil
-- return
-- end
-- vim.ob.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }, {navic.get_location, cond = navic.is_available}
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {"nvim_diagnostic"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      }, 'encoding', 'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
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
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}

