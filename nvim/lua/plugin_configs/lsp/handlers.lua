local window = require("ui.window")
local M = {}

M.setup = function()
	--[[local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}]]

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, window)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, window)
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		print("error set illuminate")
		return
	end
	illuminate.on_attach(client)
	-- end
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function auto_format(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")

M.on_attach = function(client, bufnr)
	--vim.notify(client.name .. " starting...")
	local cap = client.server_capabilities

	cap.semanticTokensProvider = nil
	if cap.documentSymbolProvider then
		navic.attach(client, bufnr)
		navbuddy.attach(client, bufnr)
		lsp_highlight_document(client)
	end

	--cap.document_formatting = false
	auto_format(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
--[[capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}]]

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
