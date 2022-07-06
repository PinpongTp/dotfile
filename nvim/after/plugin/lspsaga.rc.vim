if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
  },
  server_filetype_map = {

  },
  definition_preview_icon = "  ",
}


local action = require 'lspsaga.codeaction'

vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("v", "ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true,noremap = true })


EOF

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-J> <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
"nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
inoremap <silent> gk <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>
nnoremap <silent> gr <Cmd>Lspsaga rename<CR>
