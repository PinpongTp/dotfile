return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile"},
  main = "ibl",
  opts = {
    enabled = false,
    indent = {
      char = "▏",
      highlight = { "IndentGuide", "VertSplit" },
      smart_indent_cap = true,
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      show_exact_scope = true, -- tbc
      highlight = { "IndentGuideOdd" },
      include = {
        node_type = { ["*"] = { "*" } },
      },
    },
  },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", ";ti", ":IBLToggle<CR>", { desc = "Toggle indent" })
  end,
}

