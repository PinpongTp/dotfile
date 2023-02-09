local ok, _ = pcall(require, "lsp-zero")
if not ok then
  return
end

print('test load lsp-zero')

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false,
})

lsp.nvim_workspace()

lsp.setup()

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

--require 'plugin_configs.lsp.cmp'
require 'plugin_configs.lsp.config'
require 'plugin_configs.lsp.null-ls'
require 'plugin_configs.lsp.saga'
require 'plugin_configs.lsp.toggle-lsp-diagnostics'
