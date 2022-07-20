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

-- [[ Setup ]]
set.mouse = 'a'

set.wrap = true
--set.scrolloff = 999
set.number = true
set.relativenumber = true
set.title = true
set.colorcolumn = '120'
--set.cmdheight = 2
--set.cursorline = true
cmd('au BufEnter * setlocal cursorline')
cmd('au BufLeave * setlocal nocursorline')

-- [[ Theme ]]
set.syntax = "ON"
set.termguicolors = true
set.background = dark
set.titlestring = vim.fn.expand('%:~:p:h') -- TODO what is :h
cmd('colorscheme dracula') -- cmd:  Set the colorscheme
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')
