local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
on_attach = require("plugin_configs.lsp.handlers").on_attach,
	debug = true,
	sources = {
		formatting.prettier.with({ extra_args = { "--single-quote" } }),
		formatting.stylua,
    diagnostics.eslint, null_ls.builtins.code_actions.eslint,
    --null_ls.builtins.code_actions.gitsigns
	},
})
