vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smarttab = true

-- [[ Folding ]]
opt.foldcolumn = "0" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- [[ Encoding ]]
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"

opt.wrap = true

-- search settings
opt.hlsearch = true -- check this
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- color
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

cmd("au BufEnter * setlocal cursorline")
cmd("au BufLeave * setlocal nocursorline")

-- [[ Theme ]]
--set.guifont = "Menlo:h12"
opt.guifont = "Meslo:h12"
--set.guifont = "Mono:h12"
opt.syntax = "ON"
opt.termguicolors = true

opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = '%{expand("%:~:p:h")}'
cmd("filetype plugin on") -- for markdown plugin
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

cmd("let g:vim_markdown_folding_disabled = 1") -- for open folding on active markdown file
