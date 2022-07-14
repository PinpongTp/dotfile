-- [[ keys.lua ]] --
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
vim.g.mapleader = ' '

-- config
map('n', 'x', '"_x', opts)
map("v", "p", '"_dP', opts)
map('n', 'dw', 'vb"_d', opts)

-- control
map('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map('n', '<Leader>Q', ':q!<CR>', { noremap = true, silent = true })
--map('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})
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
map('n', 'bq', ':bw<CR>', { noremap = true, silent = true })
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
map('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = false })

-- telescope
map('n', ';ff', ':Telescope find_files<CR>', opts)
map('n', ';fh', ':Telescope find_files hidden=true<CR>', opts)
map('n', ';fd', ':Telescope file_browser<CR>', opts)
map('n', ';fb', ':Telescope buffers<CR>', opts)
map('n', ';fl', ':Telescope live_grep<CR>', opts)
map('n', ';fg', ':Telescope git_files<CR>', opts)
map('n', ';fm', ':Telescope marks<CR>', opts)
map('n', ';;', ':Telescope help_tags<CR>', opts)

-- git
map('n', ';gs', ':Telescope git_status<CR>', opts)
map('n', ';gc', ':Telescope git_commits<CR>', opts)
map('n', ';gb', ':Telescope git_branches<CR>', opts)
map('n', ';gd', ':Gitsigns diffthis<CR>', opts)
map('n', ';gm', ':Git blame<CR>', opts)
map('n', ';gl', ':Gitsigns blame_line<CR>', opts)

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

-- Insert --
-- Press jk fast to exit insert mode
map("i", "JK", "<ESC>", opts)

-- Move text up and down by visual
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Git --
map("n", "<C-g>", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", opts)
map("n", "<Leader>gl", ":Gitsigns blame_line<CR>", opts)
map("n", "<Leader>gb", ":Git blame<CR>", opts)
