vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "vv", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit vim" })


keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { desc = "Open Explore" })

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
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

