local status_ok, _ = pcall(require, "dap")
if not status_ok then
  return
end

require 'plugin_configs.dap.dap'
