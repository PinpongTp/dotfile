return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim", 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

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
              -- ["o"] = fb_actions.open
              -- your custom normal mode mappings
            },
          },
        },
      },
    }

    telescope.load_extension("fzf")


    local keymap = vim.keymap

    keymap.set("n", ";ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
    keymap.set("n", ";fh", "<Cmd>Telescope find_files hidden=true<CR>", { desc = "Find files" })
    keymap.set("n", ";fl", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
    keymap.set("n", ";fo", "<Cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
    keymap.set("n", ";fg", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", ";fs", "<Cmd>Telescope git_status<CR>", { desc = "Find git status" })
    keymap.set("n", ";fc", "<Cmd>Telescope colorscheme<CR>", { desc = "Find color scheme" })
    keymap.set("n", ";fm", "<Cmd>Telescope marks<CR>", { desc = "Find marks" })
    keymap.set("n", ";fb", "<Cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    keymap.set("n", ";;", "<Cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
    --keymap.set("n", ";fw", "<Cmd>Telescope file_browser<CR>", { desc = "Find file browser" })
    --keymap.set("n", ";ft", "<Cmd>TodoTelescope<CR>", { desc = "Find todo" })

  end,
}
