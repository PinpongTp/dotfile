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
set.shiftwidth = 2
set.tabstop = 2
set.mouse = 'a'
set.wrap = true
set.colorcolumn = '120'
set.cursorline = true
set.hlsearch = true
set.incsearch = true
set.scrolloff = 5
set.fileencoding = 'utf-8'
cmd('set clipboard+=unnamedplus') -- TODO set by lua


-- [[ Theme ]]
set.syntax = "ON"
set.termguicolors = true
set.background = dark
set.titlestring = vim.fn.expand('%:~:p:h') -- TODO what is :h
cmd('colorscheme dracula') -- cmd:  Set the colorscheme