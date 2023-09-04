-- [[ keys.lua ]] --
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set -- TODO: refactor
local opts = { noremap = true, silent = false }
vim.g.mapleader = " "
-- config
map("n", "x", '"_x', opts)
map("v", "x", '"_x', opts)
--map("v", "d", '"_d', opts)
--map("n", "d", '"_d', opts)
map("v", "p", '"_dP', opts)

map("n", "tj", "10j", opts)
map("n", "tk", "10k", opts)

-- packer
map("n", ";ps", ":PackerSync<CR>", opts)

-- control

map("n", "<Leader>q", ":q<CR>", opts)
map("n", "<Leader>Q", ":qa!<CR>", opts)
map("n", ";w", ":w<CR>", opts)
map("n", ";q", ":q<CR>", opts)
map("n", ";Q", ":qa<CR>", opts)

--map('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
map("n", "<Leader>W", ":wq<CR>", opts)
map("n", "<Leader>S", ":so %<CR>", opts)
map("n", "<Leader>e", ":Exp<CR>", { noremap = true })

-- un mark
map("n", "vv", ":noh<CR>", opts)

-- Split window and Select/Switch window
map("n", "ss", ":split<CR><C-w>w", { noremap = false })
map("n", "sv", ":vsplit<CR><C-w>w", { noremap = false })
map("n", "s-", ":split<CR><C-w>w", { noremap = false })
map("n", "s|", ":vsplit<CR><C-w>w", { noremap = false })
map("n", "sr", ":SmartResizeMode<CR>", { noremap = false })

map("n", "<Leader>w", "<C-w>w", { noremap = false, desc = "Switch Window" })

-- Buf and Tab
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
--map("n", "q<Tab>", ":bw<CR>", { noremap = true, silent = true })

map("n", "<Leader>b.", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
map("n", "<Leader>b,", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap("n", "<Leader>bq", function()
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

-- openBrowser
-- :OpenBrowser
-- map('n', 'i', ':bw<CR>', { noremap = true, silent = true })

map("n", "<Leader>tt", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "<Leader>tr", ":TablineTabRename", { noremap = true, silent = true })
map("n", "<Leader>tn", ":tabnew %<CR>", { noremap = true, silent = true })
map("n", "<Leader>t.", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "<Leader>t,", ":tabprev<CR>", { noremap = true, silent = true })
map("n", "<Leader>t<", ":tabm -1<CR>", { noremap = true, silent = true })
map("n", "<Leader>t>", ":tabm +1<CR>", { noremap = true, silent = true })
map("n", "<Leader>tq", ":q<CR>", { noremap = true, silent = true })

-- nvimTree
map("n", "<Leader>m", ":NvimTreeFindFileToggle<CR>", { noremap = false, silent = true })
map("n", "<Leader>n", ":NvimTreeFindFileToggle<CR>", { noremap = false, silent = true })
map("n", "<Leader>N", ":NvimTreeFindFile<CR>", { noremap = false, silent = true })

-- hop
map("n", "<Leader>ff", ":HopChar1<CR>", opts)
map("n", "<Leader>fF", ":HopPattern<CR>", opts)
map("n", "<Leader>fl", ":HopLine<CR>", opts)
map("n", "<Leader>fw", ":HopWord<CR>", opts)
map("n", "<Leader>fh", ":HopVertical<CR>", opts)
map("n", "F", ":HopChar1<CR>", opts)

-- telescope
map("n", ";ff", ":Telescope find_files<CR>", opts)
map("n", ";fh", ":Telescope find_files hidden=true<CR>", opts)
map("n", ";fd", ":Telescope file_browser<CR>", opts)
map("n", ";fb", ":Telescope buffers<CR>", opts)
map("n", ";fl", ":Telescope live_grep<CR>", opts)
map("n", ";fg", ":Telescope git_files<CR>", opts)
map("n", ";fm", ":Telescope marks<CR>", opts)
map("n", ";fc", ":Telescope colorscheme<CR>", opts)
map("n", ";fs", ":Telescope git_status<CR>", opts)
map("n", ";;", ":Telescope help_tags<CR>", opts)
map("n", ";ft", ":TodoTelescope<CR>", opts)

--map('n', '<Leader>dft', ':Telescope dap commands', opts)
--map('n', '<Leader>dfc', ':Telescope dap configurations', opts)
--map("n", "<Leader>db", ":Telescope dap list_breakpoints", opts)
--map('n', '<Leader>dfv', ':Telescope dap variables', opts)
--map("n", "<Leader>df", ":Telescope dap frames", opts)
--map("n", "<Leader>dq", ':lua require("dapui").toggle()<CR>', opts)
--map("n", "<Leader>dI", ':lua require("dapui").eval()<CR>', opts)

-- git
map("n", ";gs", ":Telescope git_status<CR>", opts)
map("n", ";gc", ":Telescope git_commits<CR>", opts)
map("n", ";gb", ":Telescope git_branches<CR>", opts)
map("n", ";gC", ":Telescope git_bcommits<CR>", opts)
map("n", ";gd", ":Gitsigns diffthis<CR>", opts)
map("n", ";gm", ":Git blame<CR>", opts)
map("n", ";gl", ":Gitsigns blame_line<CR>", opts)
map("n", ";grh", ":Gitsigns reset_hunk<CR>", opts)
map("n", ";grb", ":Gitsigns reset_buffer<CR>", opts)
map("n", ";ga", ":Gitsigns stage_hunk<CR>", opts)
map("n", ";gu", ":Gitsigns undo_stage_hunk<CR>", opts)
map("n", ";gp", ":Gitsigns preview_hunk<CR>", opts)
map("n", ";gi", ":Gitsigns preview_hunk_inline<CR>", opts)

-- Git --
map("n", "<C-g>", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", opts)
map("n", "<Leader>gl", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gb", ":Git blame<CR>", opts)

-- github copilot
--map("i", "<Right>", ":copilot#Accept()<CR>", opts)
-- map key for insert mode

-- gpt
--map("n", "<Leader>Cc", ":ChatGPT<CR>", opts)

-- mode
map("n", ";mz", ":ZenMode<CR>", opts)
map("n", ";ma", ":Alpha<CR>", opts)
map("n", ";ml", ":Limelight!<CR>", opts)
map("n", ";mL", ":Limelight 0.5<CR>", opts)
map("n", ";z", ":ZenMode<CR>", opts)

-- Move text up and down by visual
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
--map("n", "<Leader>rr", ":lua require('rest-nvim').run()<CR>", opts)
--map("n", "<Leader>rr", ":lua require('rest-nvim')RestNvim<CR>", opts)

keymap("n", "<leader>rr", function()
	require("rest-nvim").RestNvim()
end)
map("n", "<Leader>rp", ":lua require('rest-nvim')RestNvimPreview<CR>", opts)
map("n", "<Leader>rl", ":lua require('rest-nvim')RestNvimLast<CR>", opts)
--map("n", "<Leader>rR", ":lua require('rest-nvim').run(true)<CR>", opts)

-- FloatermNew
--map("n", ";tt", ":FloatermToggle<CR>", opts)
--map("n", "<C-t>", ":FloatermToggle<CR>", opts)

-- floating
map("n", "zR", ":lua require('ufo').openAllFolds()<CR>", opts)
map("n", "zM", ":lua require('ufo').closeAllFolds()<CR>", opts)

-- toggle and mode
--map("n", ";tg", ":FloatermNew --width=0.9 --height=0.9 lazygit<CR>", opts)
--map("n", "<c-t>", ":ToggleTerm<CR>", opts)
--map("n", "<c-q>", ":ToggleTermToggleAll!<CR>", opts)
--vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
map("n", ";tc", ":ColorizerToggle<CR>", opts)
map("n", ";tC", ":TSContextToggle<CR>", opts) -- context on top window
map("n", ";ti", ":IndentBlanklineToggle<CR>", opts)
map("n", ";tn", ":set rnu!<CR>", opts)
map("n", ";tm", ":Mason<CR>", { desc = "Mason" })
map("n", ";tl", ":Lazy<CR>", { desc = "Lazy" })

local is_fold_column_show = false
keymap("n", ";tf", function()
	if is_fold_column_show then
		vim.cmd(":set foldcolumn=0")
	else
		vim.cmd(":set foldcolumn=1")
	end

	is_fold_column_show = not is_fold_column_show
end, { desc = "toggle fold column" })

-- toggle outline
map("n", "<Leader>o", ":SymbolsOutline<CR>", opts) -- TODO: remove this
--map("n", "<Leader>O", ":Lspsaga outline<CR>", opts) -- setup at saga config

-- navbuddy
map("n", ";fn", ":Navbuddy<CR>", opts) -- context on top window
