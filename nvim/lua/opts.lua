-- [[ opts.lua ]] --
local set = vim.opt
local cmd = vim.api.nvim_command

-- [[ setup ]]
set.number = true
set.relativenumber = true
set.title = true
set.autoindent = true
set.ignorecase = true
set.expandtab = true
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2
set.mouse = 'a'
set.wrap = true
set.colorcolumn = '120'
--set.cmdheight = 2
--set.cursorline = true
cmd('au BufEnter * setlocal cursorline')
cmd('au BufLeave * setlocal nocursorline')
set.hlsearch = true
set.incsearch = true
set.scrolloff = 0
set.fileencoding = 'utf-8'
cmd('set clipboard+=unnamedplus') -- TODO set by lua


-- [[ Theme ]]
set.syntax = "ON"
set.termguicolors = true
set.background = dark
set.titlestring = vim.fn.expand('%:~:p:h') -- TODO what is :h
cmd('colorscheme dracula') -- cmd:  Set the colorscheme
