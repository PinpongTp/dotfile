function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    prompt_prefix = "  ",
    file_ignore_patterns = { "node_modules" },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,

        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          ["o"] = fb_actions.open
          -- your custom normal mode mappings
        },
      },
    },
  },
}

telescope.load_extension "file_browser"
--telescope.load_extension "dap"

local transform_mod = require('telescope.actions.mt').transform_mod

-- or create your custom action
local my_cool_custom_action = transform_mod({
  x = function(prompt_bufnr)
    print("This function ran after another action. Prompt_bufnr: " .. prompt_bufnr)
    -- Enter your function logic here. You can take inspiration from lua/telescope/actions.lua
  end,
})
