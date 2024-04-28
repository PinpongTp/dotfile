vim.g.mapleader = " "

local keymap = vim.keymap

-- utility
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", ";tn", ":set rnu!<CR>", { desc = "Toggle relative line number" })
keymap.set("n", "vv", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit vim" })
keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { desc = "Open Explore" })
keymap.set("n", ";tm", ":Mason<CR>", { desc = "Mason" })
keymap.set("n", ";tl", ":Lazy<CR>", { desc = "Lazy" })

keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })
keymap.set("n", "x", '"_x', { desc = "Delete without yanking" })
keymap.set("v", "x", '"_x', { desc = "Delete without yanking" })
--keymap.set("n", "d", '"_d', { desc = "Delete without yanking" })
--keymap.set("v", "d", '"_d', { desc = "Delete without yanking" })
keymap.set("n", "tj", "10j", { desc = "Move 10 lines down" })
keymap.set("n", "tk", "10k", { desc = "Move 10 lines up" })

-- text movement
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- window managemenv
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
-- Split window and Select/Switch window
keymap.set("n", "sh", ":split<CR><C-w>w", { noremap = false, desc = "Split window" })
keymap.set("n", "sv", ":vsplit<CR><C-w>w", { noremap = false, desc = "Vsplit window" })
keymap.set("n", "sr", ":SmartResizeMode<CR>", { noremap = false, desc = "Smart resize window" })

-- Buf and Tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
--- buf
keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap.set("n", ";q", ":bw<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>b.", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap.set("n", "<Leader>b,", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap.set("n", "<Leader>bq", function()
	local is_open = require("nvim-tree.view").is_visible()
	local api = require("nvim-tree.api")
	if is_open then
		api.tree.close()
		vim.cmd(":bw")
		api.tree.toggle({ focus = false })
	else
		vim.cmd(":bw")
	end
end, { desc = "Close Buffer" })
