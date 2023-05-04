-- [[ keys.lua ]] --
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }
vim.g.mapleader = " "
-- config
map("n", "x", '"_x', opts)
map("v", "p", '"_dP', opts)
map("n", "dw", 'vb"_d', opts)
map("n", ";pr", ":so ~/.config/nvim/init.lua<CR>", opts)

-- packer
map("n", ";ps", ":PackerSync<CR>", opts)

-- control
map("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })
--map('i', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map("v", "<Leader>q", ":q<CR>", { noremap = true, silent = true })
map("n", "<Leader>Q", ":q!<CR>", { noremap = true, silent = true })
--map('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
map("n", "<Leader>W", ":wq<CR>", { noremap = true, silent = true })
map("n", "<Leader>S", ":so %<CR>", { noremap = true })
map("n", "<Leader>e", ":Exp<CR>", { noremap = true })

-- redo
-- map("n", "U", ":redo<CR>", { noremap = true })
-- un mark
map("n", "vv", ":noh<CR>", { noremap = true })

-- Split window and Select/Switch window
map("n", "ss", ":split<CR><C-w>w", { noremap = false })
map("n", "sv", ":vsplit<CR><C-w>w", { noremap = false })
map("n", "s-", ":split<CR><C-w>w", { noremap = false })
map("n", "s|", ":vsplit<CR><C-w>w", { noremap = false })
map("n", "sh", "<C-w>h", { noremap = false })
map("n", "sj", "<C-w>j", { noremap = false })
map("n", "sk", "<C-w>k", { noremap = false })
map("n", "sl", "<C-w>l", { noremap = false })

map("n", "<Leader>w", "<C-w>w", { noremap = false })
--map('n', '<Leader>ww', '<C-w>w', { noremap = false })

-- Buf and Tab
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "q<Tab>", ":bw<CR>", { noremap = true, silent = true })
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

-- nerdTree
--[[map('n', '<Leader>m', ':NERDTreeToggle<CR>', { noremap = false })]]
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
--map('n', 'F', ':HopPattern<CR>', opts)

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

--
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

-- spector
--map('n', '<Leader>dd', ':call vimspector#Launch()<CR>', opts)
--map('n', '<Leader>de', ':call vimspector#Reset()<CR>', opts)
--map('n', '<Leader>dc', ':call vimspector#Continue()<CR>', opts)
--map('n', '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>', opts)
--map('n', '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>', opts)
--map('n', '<Leader>dk', ':call vimspector#Restart()<CR>', opts)
--map('n', '<Leader>dh', ':call vimspector#StepOut()<CR>', opts)
--map('n', '<Leader>dl', ':call vimspector#StepInto()<CR>', opts)
--map('n', '<Leader>dj', ':call vimspector#StepOver()<CR>', opts)

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

-- lsp saga
map("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = false })
map("i", "<C-J>", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = false })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = false })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = false })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = false })
map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", { noremap = true, silent = false })
map("n", "gk", "<cmd>Lspsaga signature_help<CR>", { noremap = true, silent = false })
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = false })
map("n", "gp", "<cmd>Lspsaga preview_definition<CR>", { noremap = true, silent = false })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = false })
map("n", ";td", "<cmd>ToggleDiag<CR>", opts)
map("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
map("v", "ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true, noremap = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- indent
map("n", ";ti", ":IndentBlanklineToggle<CR>", opts)

-- mode
map("n", ";mz", ":ZenMode<CR>", opts)
map("n", ";ma", ":Alpha<CR>", opts)
map("n", ";ml", ":Limelight!<CR>", opts)
map("n", ";mL", ":Limelight 0.5<CR>", opts)
map("n", ";z", ":ZenMode<CR>", opts)

-- Move text up and down by visual
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

map("n", "<Leader>rr", ":lua require('rest-nvim').run()<CR>", opts)
map("n", "<Leader>rR", ":lua require('rest-nvim').run(true)<CR>", opts)

-- FloatermNew
map("n", ";tt", ":FloatermToggle<CR>", opts)
map("n", "<C-t>", ":FloatermToggle<CR>", opts)

-- toggle and mode
map("n", ";tg", ":FloatermNew --width=0.9 --height=0.9 lazygit<CR>", opts)
map("n", ";ts", ":SymbolsOutline<CR>", opts)
map("n", ";tc", ":ColorizerToggle<CR>", opts)
map("n", ";tC", ":TSContextToggle<CR>", opts) -- context on top window

-- navbuddy
map("n", ";fn", ":Navbuddy<CR>", opts) -- context on top window
--
--
