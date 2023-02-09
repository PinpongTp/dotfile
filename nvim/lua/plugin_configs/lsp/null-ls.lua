local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

--null_ls.setup {
--sources = {
--null_ls.builtins.formatting.prettier
--}
--}

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  on_attach = require("plugin_configs.lsp.handlers").on_attach,
  debug = true,
  sources = {
    formatting.prettier.with({ extra_args = { "--single-quote" } }),
    formatting.stylua,
    diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.gitsigns
  },
})
