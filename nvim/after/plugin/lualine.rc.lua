local status, lualine = pcall(require, "lualine")
if (not status) then return end

local navic = require("nvim-navic")
local tabline = require("tabline")
tabline.setup {
  enable = false,
  options = {
    -- If lualine is installed tabline will use separators configured in lualine by default.
    -- These options can be used to override those settings.
    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
    -- max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = true, -- shows base filename only instead of relative path in filename
    modified_icon = " " -- change the default modified icon
    -- modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
    -- show_tabs_only = false -- this shows only tabs instead of tabs + ffers
  }
}
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
    lualine_b = {'diff'},
    -- lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }, {navic.get_location, cond = navic.is_available}
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {"nvim_diagnostic"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      } -- 'encoding', 
      -- 'filetype'
    },
    lualine_y = {'failetype'},
    -- lualine_y = {'progress'},
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
    lualine_x = {
      {
        'diagnostics',
        sources = {"nvim_diagnostic", "vim_lsp"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      } -- 'encoding', 
    },
    lualine_y = {'location'},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {tabline.tabline_buffers},
    lualine_x = {tabline.tabline_tabs},
    -- lualine_x = {},
    lualine_y = {},
    lualine_z = {}
    -- lualine_z = {{'tabs', mode = 1}}
  },
  -- tabline = {lualine_a = {'buffers'}},
  extensions = {'fugitive'}
}

