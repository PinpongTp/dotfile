-- [[ keys.lua ]] --
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
vim.g.mapleader = ' '

-- config
map('n', 'x', '"_x', opts)
map("v", "p", '"_dP', opts)
map('n', 'dw', 'vb"_d', opts)

-- packer
map('n', ';ps', ':PackerSync<CR>', opts)

-- control
map('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map('i', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map('n', '<Leader>Q', ':q!<CR>', { noremap = true, silent = true })
map('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
map('n', '<Leader>W', ':wq<CR>', { noremap = true, silent = true })
map('n', '<Leader>S', ':so %<CR>', { noremap = true })

-- redo
map('n', 'U', ':redo<CR>', { noremap = true })
-- un mark
map('n', 'vv', ':noh<CR>', { noremap = true })

-- Split window
map('n', 'ss', ':split<CR><C-w>w', { noremap = false })
map('n', 'sv', ':vsplit<CR><C-w>w', { noremap = false })
map('n', '<Leader>w', '<C-w>w', { noremap = false })

-- Buf and Tab
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
map('n', 'q<Tab>', ':bw<CR>', { noremap = true, silent = true })
map('n', '<Leader>b.', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<Leader>b,', ':bprevious<CR>', { noremap = true, silent = true })
map('n', '<Leader>bq', ':bw<CR>', { noremap = true, silent = true })


map('n', '<Leader>tt', ':tabnext<CR>', { noremap = true, silent = true })
map('n', '<Leader>tr', ':TablineTabRename', { noremap = true, silent = true })
map('n', '<Leader>tn', ':tabnew %<CR>', { noremap = true, silent = true })
map('n', '<Leader>t.', ':tabnext<CR>', { noremap = true, silent = true })
map('n', '<Leader>t,', ':tabprev<CR>', { noremap = true, silent = true })
map('n', '<Leader>t<', ':tabm -1<CR>', { noremap = true, silent = true })
map('n', '<Leader>t>', ':tabm +1<CR>', { noremap = true, silent = true })
map('n', '<Leader>tq', ':q<CR>', { noremap = true, silent = true })

-- nerdTree
map('n', '<Leader>m', ':NERDTreeToggle<CR>', { noremap = false })

-- nvimTree
map('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>', { noremap = false, silent = true })
map('n', '<Leader>N', ':NvimTreeFindFile<CR>', { noremap = false, silent = true })

-- hop
map('n', '<Leader>ff', ':HopChar1<CR>', opts)
map('n', '<Leader>fF', ':HopPattern<CR>', opts)
map('n', '<Leader>fl', ':HopLine<CR>', opts)
map('n', '<Leader>fw', ':HopWord<CR>', opts)
map('n', '<Leader>fh', ':HopVertical<CR>', opts)
map('n', 'f', ':HopChar1<CR>', opts)
map('n', 'F', ':HopPattern<CR>', opts)

-- telescope
map('n', ';ff', ':Telescope find_files<CR>', opts)
map('n', ';fh', ':Telescope find_files hidden=true<CR>', opts)
map('n', ';fd', ':Telescope file_browser<CR>', opts)
map('n', ';fb', ':Telescope buffers<CR>', opts)
map('n', ';fl', ':Telescope live_grep<CR>', opts)
map('n', ';fg', ':Telescope git_files<CR>', opts)
map('n', ';fm', ':Telescope marks<CR>', opts)
map('n', ';fc', ':Telescope colorscheme<CR>', opts)
map('n', ';fs', ':Telescope git_status<CR>', opts)
map('n', ';;', ':Telescope help_tags<CR>', opts)

--
map('n', ';ft', ':TodoTelescope<CR>', opts)

-- git
map('n', ';gs', ':Telescope git_status<CR>', opts)
map('n', ';gc', ':Telescope git_commits<CR>', opts)
map('n', ';gb', ':Telescope git_branches<CR>', opts)
map('n', ';gd', ':Gitsigns diffthis<CR>', opts)
map('n', ';gm', ':Git blame<CR>', opts)
map('n', ';gl', ':Gitsigns blame_line<CR>', opts)
map('n', ';grh', ':Gitsigns reset_hunk<CR>', opts)
map('n', ';grb', ':Gitsigns reset_buffer<CR>', opts)

-- lsp saga
map('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = false })
map('i', '<C-J>', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = false })
map('n', ']e', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = false })
map('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = false })
map('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = false })
map('i', '<C-k>', ':Lspsaga signature_help<CR>', { noremap = true, silent = false })
map('n', 'gk', ':Lspsaga signature_help<CR>', { noremap = true, silent = false })
map('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = false })
map('n', 'gp', ':Lspsaga preview_definition<CR>', { noremap = true, silent = false })
map('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = false })
map('n', ';td', ':ToggleDiag<CR>', opts)

-- indent
map('n', ';ti', ':IndentBlanklineToggle<CR>', opts)

-- mode
map('n', ';mz', ':ZenMode<CR>', opts)
map('n', ';ml', ':Limelight!<CR>', opts)
map('n', ';mL', ':Limelight 0.5<CR>', opts)
map('n', ';z', ':ZenMode<CR>', opts)

-- Insert --
-- Press jk fast to exit insert mode
map("i", "JK", "<ESC>", { nowait = true, noremap = true })
--map("i", "iii", "<ESC>", { nowait = false, noremap = false, silent = false })

-- Move text up and down by visual
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Git --
map("n", "<C-g>", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", opts)
map("n", "<Leader>gl", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gb", ":Git blame<CR>", opts)

-- FloatermNew
map("n", ";tt", ":FloatermToggle<CR>", opts)
map("n", "<C-t>", ":FloatermToggle<CR>", opts)

-- toggle and mode
map("n", ";tg", ":FloatermNew lazygit<CR>", opts)
map("n", ";ts", ":SymbolsOutline<CR>", opts)
map("n", ";tc", ":TSContextToggle<CR>", opts)

--
--
