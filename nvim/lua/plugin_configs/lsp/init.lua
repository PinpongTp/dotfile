local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require 'plugin_configs.lsp.mason'
require 'plugin_configs.lsp.cmp'
--require 'plugin_configs.lsp.config'
require 'plugin_configs.lsp.null-ls'
require 'plugin_configs.lsp.saga'

--require 'plugin_configs.lsp.new.config'
--require 'plugin_configs.lsp.config'
--require 'plugin_configs.lsp.new.saga'
--require 'plugin_configs.lsp.new.null-ls'
