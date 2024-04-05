local servers = { "tsserver", "vimls", "lua_ls", "gopls", "vuels", "html", "astro" }

local mason = require("mason")
local mason_lsp = require("mason")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp.setup({
	ensure_installed = servers,
})

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

require("plugin_configs.lsp.handlers").setup()
local handlers = require("plugin_configs.lsp.handlers")
for _, server in ipairs(servers) do
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	if server == "astro" then
		opts.filetypes = { "astro" }
	end

	local has_custom_opts, server_custom_opts = pcall(require, "plugin_configs.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	nvim_lsp[server].setup(opts)
end
