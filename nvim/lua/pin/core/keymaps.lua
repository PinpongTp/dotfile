vim.g.mapleader = " "

local keymap = vim.keymap

-- utility
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", ";tn", ":set rnu!<CR>", { desc = "Toggle relative line number" })
keymap.set("n", "vv", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit vim" })
keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { desc = "Open Explore" })

-- text movement
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- window managemenv
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buf and Tab
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

keymap.set("n", ";tm", ":Mason<CR>", { desc = "Mason" })
keymap.set("n", ";tl", ":Lazy<CR>", { desc = "Lazy" })

local is_fold_column_show = false
keymap.set("n", ";tf", function()
	if is_fold_column_show then
		vim.cmd(":set foldcolumn=0")
	else
		vim.cmd(":set foldcolumn=1")
	end

	is_fold_column_show = not is_fold_column_show
end, { desc = "toggle fold column" })
