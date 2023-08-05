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
map("n", "dw", 'vb"_d', opts)

-- packer
map("n", ";ps", ":PackerSync<CR>", opts)

-- control
map("n", "<Leader>q", ":q<CR>", opts)
map("v", "<Leader>q", ":q<CR>", opts)
map("n", "<Leader>Q", ":qa!<CR>", opts)
map("n", ";w", ":w<CR>", opts)

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

map("n", "<Leader>w", "<C-w>w", { noremap = false })

-- Buf and Tab
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
--map("n", "q<Tab>", ":bw<CR>", { noremap = true, silent = true })

local cmd = vim.api.nvim_command
keymap("n", "q<Tab>", function()
	local is_open = require("nvim-tree.view").is_visible()
	local api = require("nvim-tree.api")
	if is_open then
		api.tree.close()
		vim.cmd(":bw")
		api.tree.toggle({ focus = false })
	else
		vim.cmd(":bw")
	end
end)
map("n", "<Leader>b.", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<Leader>b,", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "<Leader>bq", ":bw<CR>", { noremap = true, silent = true })

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

-- debug
--map('n', '<Leader>db', ':lua require"dap".toggle_breakpoint()<CR>', opts)
--map('n', '<Leader>dc', ':lua require"dap".continue()<CR>', opts)
--map('n', '<Leader>dso', ':lua require"dap".step_over()<CR>', opts)
--map('n', '<Leader>dsi', ':lua require"dap".step_into()<CR>', opts)
--map('n', '<Leader>dsO', ':lua require"dap".step_out()<CR>', opts)
--map('n', '<Leader>dBc', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
--map('n', '<Leader>dBm', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
--map('n', '<Leader>dl', ':lua require"dap".repl.open()<CR>', opts)
--map('n', '<Leader>dR', ':lua require"dap".run_last()<CR>', opts)
--map('n', '<Leader>di', ':lua require("dap.ui.widgets").hover()<CR>', opts)

map("n", "<Leader>dc", ":DapContinue<CR>", opts)
map("n", "<Leader>d>", ":DapStepInto<CR>", opts)
map("n", "<Leader>d<", ":DapStepOut<CR>", opts)
map("n", "<Leader>dQ", ":DapTerminate<CR>", opts)

--map('n', '<Leader>dft', ':Telescope dap commands', opts)
--map('n', '<Leader>dfc', ':Telescope dap configurations', opts)
map("n", "<Leader>db", ":Telescope dap list_breakpoints", opts)
--map('n', '<Leader>dfv', ':Telescope dap variables', opts)
map("n", "<Leader>df", ":Telescope dap frames", opts)
map("n", "<Leader>dq", ':lua require("dapui").toggle()<CR>', opts)
map("n", "<Leader>dI", ':lua require("dapui").eval()<CR>', opts)

--local debugHelper = require("debugHelper")

keymap("n", "<leader>dh", function()
	require("dap").toggle_breakpoint()
end)
keymap("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap("n", "<A-k>", function()
	require("dap").step_out()
end)
keymap("n", "<A-l>", function()
	require("dap").step_into()
end)
keymap("n", "<A-j>", function()
	require("dap").step_over()
end)
keymap("n", "<A-h>", function()
	require("dap").continue()
end)
keymap("n", "<leader>du", function()
	require("dap").up()
end)
keymap("n", "<leader>dd", function()
	require("dap").down()
end)
keymap("n", "<leader>dn", function()
	require("dap").run_to_cursor()
end)
--vim.keymap.set('n', '<leader>dc', function() require "dap".terminate() end)
keymap("n", "<leader>dR", function()
	require("dap").clear_breakpoints()
end)
keymap("n", "<leader>de", function()
	require("dap").set_exception_breakpoints({ "all" })
end)
--keymap('n', '<leader>da', function() debugHelper.attach() end)
--keymap('n', '<leader>dA', function() debugHelper.attachToRemote() end)
--vim.keymap.set('n', '<leader>dA', function() require "./debugHelper".attachToRemote() end)
keymap("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
keymap("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
keymap("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
keymap("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
keymap("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

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
map("n", ";tt", ":FloatermToggle<CR>", opts)
map("n", "<C-t>", ":FloatermToggle<CR>", opts)

-- floating
map("n", "zR", ":lua require('ufo').openAllFolds()<CR>", opts)
map("n", "zM", ":lua require('ufo').closeAllFolds()<CR>", opts)

-- toggle and mode
map("n", ";tg", ":FloatermNew --width=0.9 --height=0.9 lazygit<CR>", opts)
map("n", ";tc", ":ColorizerToggle<CR>", opts)
map("n", ";tC", ":TSContextToggle<CR>", opts) -- context on top window
map("n", ";ti", ":IndentBlanklineToggle<CR>", opts)
map("n", ";tn", ":set rnu!<CR>", opts)

-- toggle outline
map("n", "<Leader>o", ":SymbolsOutline<CR>", opts) -- TODO: remove this
--map("n", "<Leader>O", ":Lspsaga outline<CR>", opts) -- setup at saga config

-- navbuddy
map("n", ";fn", ":Navbuddy<CR>", opts) -- context on top window
--
--
