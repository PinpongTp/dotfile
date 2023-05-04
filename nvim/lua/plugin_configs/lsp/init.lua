--local ok, _ = pcall(require, "lsp-zero")
--if not ok then
--return
--end

----print('test load lsp-zero')

--local lsp = require("lsp-zero")
--lsp.preset({
--name = "minimal",
--set_lsp_keymaps = false,
--})
--lsp.nvim_workspace()
--lsp.setup()

require("plugin_configs.lsp.cmp")
require("plugin_configs.lsp.config")
require("plugin_configs.lsp.null-ls")
require("plugin_configs.lsp.saga")
require("plugin_configs.lsp.toggle-lsp-diagnostics")
require("plugin_configs.lsp.fidget")
