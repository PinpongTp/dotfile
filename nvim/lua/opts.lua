-- [[ opts.lua ]] --
local set = vim.opt
local cmd = vim.api.nvim_command

-- [[ Encoding ]]
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileencodings = 'utf-8'

-- [[ Tabs ]]
set.autoindent = true
set.expandtab = true
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2

-- [[ Searching ]]
set.hlsearch = true
set.incsearch = true
set.ignorecase = true

-- [[ Clipboard sync ]]
cmd('set clipboard+=unnamedplus') -- TODO set by lua
cmd('set noswapfile')
cmd('set nobackup')
--cmd('set backupdir=~/.config/nvim/cache') -- TODO: check this

-- [[ Setup ]]
set.mouse = 'a'

set.wrap = true
--set.scrolloff = 999
set.ttyfast = true
set.number = true
set.relativenumber = false
set.title = true
set.colorcolumn = '120'
--set.cmdheight = 2
--set.cursorline = true
cmd('au BufEnter * setlocal cursorline')
cmd('au BufLeave * setlocal nocursorline')

-- [[ Theme ]]
set.guifont = "Menlo:h14"
--set.guifont = "Mono:h12"
set.syntax = "ON"
set.termguicolors = true
set.background = dark
set.titlestring = vim.fn.expand('%:~:p:h') -- TODO what is :h
cmd('filetype plugin on') -- for markdown plugin
cmd('colorscheme dracula') -- cmd:  Set the colorscheme
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- [[ zen mode ]]
cmd('let g:vim_markdown_folding_disabled = 1') -- for open folding on active markdown file
