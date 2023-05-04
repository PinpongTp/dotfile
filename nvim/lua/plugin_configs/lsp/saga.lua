local ok, saga = pcall(require, "lspsaga")
if not ok then
	return
end

--[[saga.init_lsp_saga({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	border_style = "round",
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "v",
		tabe = "t",
		quit = "q",
	},
	server_filetype_map = {},
	definition_preview_icon = "  ",
})]]

--local action = require("lspsaga.codeaction")

-- lsp saga
--[[map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = false })]]
--[[map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = false })]]
--[[map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = false })
map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = false })
map("n", "gk", "<cmd>Lspsaga signature_help<CR>", { noremap = true, silent = false })
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = false })
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = false })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = false })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = false })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = false })
map("n", "ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
map("n", ";td", "<cmd>ToggleDiag<CR>", opts)
map("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
map("v", "ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true, noremap = true })]]

local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
--[[keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")]]

-- Go to type definition
--[[keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")]]

-- Show line diagnostics
-- ou can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<Leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<Leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<Leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<Leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
