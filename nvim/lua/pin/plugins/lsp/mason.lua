return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local servers = { "tsserver", "lua_ls", "gopls", "vuels", "html", "astro", "cssls", "tailwindcss", "emmet_ls" }

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

  end,
}
