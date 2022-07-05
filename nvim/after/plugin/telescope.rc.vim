if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files() hidden=false<cr>
nnoremap <silent> ;F <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> ;g <cmd>Telescope git_status<cr>
nnoremap <silent> ;G <cmd>Telescope git_commits<cr>
nnoremap <silent> ;b <cmd>Telescope git_branches<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
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
  }
}

local transform_mod = require('telescope.actions.mt').transform_mod

-- or create your custom action
local my_cool_custom_action = transform_mod({
  x = function(prompt_bufnr)
    print("This function ran after another action. Prompt_bufnr: " .. prompt_bufnr)
    -- Enter your function logic here. You can take inspiration from lua/telescope/actions.lua
  end,
})



EOF

