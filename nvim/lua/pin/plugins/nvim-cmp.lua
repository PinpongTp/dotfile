return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    --"hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
    --"hrsh7th/cmp-nvim-lua",
    "onsails/lspkind-nvim",
  },
  config = function()
    local cmp = require("cmp")
    local window = require("pin.core.ui.window")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        --{ name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          maxwidth = 50,
          before = function(entry, item)
            local menu_icon = {
              nvim_lsp = "[Lsp]",
              luasnip = "[Snp]",
              buffer = "[Buf]",
              path = "[Pat]",
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        }),
      },
      window = {
        completion = cmp.config.window.bordered(window),
        documentation = cmp.config.window.bordered(window),
      },
    })

  end,
}
