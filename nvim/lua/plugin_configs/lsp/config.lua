local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end
--local lsp_install = require('nvim-lsp-installer')
local servers = { "tsserver", "vimls", "lua_ls", "gopls", "vuels", "html" }

--lsp_install.setup({
--ensure_installed = servers,
--})


for _, server in pairs(servers) do
  local opts = {
    on_attach = require("plugin_configs.lsp.handlers").on_attach,
    capabilities = require("plugin_configs.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "plugin_configs.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  nvim_lsp[server].setup(opts)
end
