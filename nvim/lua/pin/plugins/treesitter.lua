return {
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground", -- TD: maybe not use
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
			"tpope/vim-surround",
		},
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = {},
        },
        autotag = {
          enable = true,
          filetype = { "html", "vue", "astro" },
        },
        ensure_installed = {
          "tsx",
          "javascript",
          "typescript",
          "astro",
          "toml",
          "fish",
          "php",
          "json",
          "yaml",
          "html",
          "scss",
          "dockerfile",
          "lua",
          "vim",
          "vue",
          "markdown",
          "markdown_inline",
          "bash",
          "gitignore",
          "query",
          "vimdoc",
          "c",
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

      local treesitter_context = require("treesitter-context")
      treesitter_context.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = {
            "class",
            "function",
            "method",
            "for", -- These won't appear in the context
            "while",
            "if",
            "switch",
            "case",
          },
        },
        exact_patterns = {},
        zindex = 20, -- The Z-index of the context window
        mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
      })

    local keymap = vim.keymap

    keymap.set("n", ";tC", "<Cmd>TSContextToggle<CR>", { desc = "Toggle treesitter context" })

   end,
}
