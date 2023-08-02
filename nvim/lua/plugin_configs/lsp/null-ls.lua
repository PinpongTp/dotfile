local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	on_attach = require("plugin_configs.lsp.handlers").on_attach,
	--debug = true,
	sources = {
		formatting.prettierd.with({ extra_args = { "--single-quote" } }),
		formatting.stylua,
		diagnostics.eslint_d,
		code_actions.eslint_d.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			-- todo code_actions on save only
		}),
		--code_actions.gitsigns,
	},
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
