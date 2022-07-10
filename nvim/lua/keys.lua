--[[ keys.lua ]] local map = vim.api.nvim_set_keymap

vim.cmd [[echo "load keymap"]]
vim.g.mapleader = ' '

-- control
map('n', '<Leader>q', ':q<CR>', {noremap = true, silent = true})
map('n', '<Leader>Q', ':q!<CR>', {noremap = true, silent = true})
--map('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})
map('n', '<Leader>W', ':wq<CR>', {noremap = true, silent = true})
map('n', '<Leader>S', ':so %<CR>', {noremap = true})

-- redo
map('n', 'U', ':redo<CR>', {noremap = true})
-- un mark
map('n', 'vv', ':noh<CR>', {noremap = true})

-- Split window
map('n', 'ss', ':split<CR><C-w>w', {noremap = false})
map('n', 'sv', ':vsplit<CR><C-w>w', {noremap = false})
map('n', '<Leader>w', '<C-w>w', {noremap = false})

-- Buf and Tab
map('n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-Tab>', ':bprevious<CR>', {noremap = true, silent = true})
map('n', 'bq', ':bw<CR>', {noremap = true, silent = true})

-- nerdTree
map('n', '<Leader>n', ':NERDTreeToggle<CR>', {noremap = false})

-- telescope
map('n', ';f', ':Telescope find_files<CR>', {noremap = true, silent = true})
map('n', ';F', ':Telescope find_files hiddend=true<CR>',
    {noremap = true, silent = true})
map('n', ';r', ':Telescope live_grep<CR>', {noremap = true, silent = true})
map('n', ';g', ':Telescope git_status<CR>', {noremap = true, silent = true})
map('n', ';G', ':Telescope git_commits<CR>', {noremap = true, silent = true})
map('n', ';b', ':Telescope git_branches<CR>', {noremap = true, silent = true})
map('n', ';;', ':Telescope help_tags<CR>', {noremap = true, silent = true})
-- map('n', '\\\\', ':Telescope buffers<CR>', {noremap = true, silent = true})

-- lsp saga

map('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = false})
map('i', '<C-J>', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = false})
map('n', ']e', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = false})
map('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>', {noremap = true, silent = false})
map('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = false})
map('i', '<C-k>', ':Lspsaga signature_help<CR>', {noremap = true, silent = false})
map('n', 'gk', ':Lspsaga signature_help<CR>', {noremap = true, silent = false})
map('n', 'gh', ':Lspsaga lsp_finder<CR>', {noremap = true, silent = false})
map('n', 'gp', ':Lspsaga preview_definition<CR>', {noremap = true, silent = false})
map('n', 'gr', ':Lspsaga rename<CR>', {noremap = true, silent = false})
