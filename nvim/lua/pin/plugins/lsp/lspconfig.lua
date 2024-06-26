return {
	"neovim/nvim-lspconfig",
	enable = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- { "nvimdev/lspsaga.nvim" },
		{ "RRethy/vim-illuminate", enable = false },
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definition"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				--opts.desc = "Smart rename"
				--keymap.set("n", "gr", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

				-- opts.desc = "Prev diagnostic"
				-- keymap.set("n", "[e", vim.diagnostic.goto_prev)
				-- opts.desc = "Next diagnostic"
				-- keymap.set("n", "]e", vim.diagnostic.goto_next)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

				-- opts.desc = "Prev diagnostic Error only"
				-- keymap.set(
				-- 	"n",
				-- 	"[E",
				-- 	":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
				-- 	opts
				-- )

				-- opts.desc = "Next diagnostic Error only"
				-- keymap.set(
				-- 	"n",
				-- 	"]E",
				-- 	":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
				-- 	opts
				-- )

				-- vim.keymap.set("n", "<space>f", function()
				-- 	vim.lsp.buf.format({ async = true })
				-- end, opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local on_attach = function(client, bufnr)
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end
			if client.server_capabilities.documentSymbolProvider then
				require("nvim-navic").attach(client, bufnr)
			end

			client.server_capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
		end

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
