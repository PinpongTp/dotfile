-- [[ opts.lua ]] --
local set = vim.opt
local cmd = vim.api.nvim_command

-- [[ Folding ]]
set.foldcolumn = "0" -- '0' is not bad
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true
set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- [[ Encoding ]]
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.fileencodings = "utf-8"

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
cmd("set clipboard+=unnamedplus") -- TODO set by lua
cmd("set noswapfile")
cmd("set nobackup")
--cmd('set backupdir=~/.config/nvim/cache') -- TODO: check this

-- [[ Setup ]]
set.mouse = "a"

--set.timeoutlen = 500
--set.ttimeoutlen = 0
--set.timeout = true

set.wrap = true
--set.scrolloff = 999
set.ttyfast = true
set.number = true
set.showcmd = false
set.relativenumber = true
set.title = true
--set.colorcolumn = "120"
--set.cmdheight = 2
--set.cursorline = true
cmd("au BufEnter * setlocal cursorline")
cmd("au BufLeave * setlocal nocursorline")

-- [[ Theme ]]
--set.guifont = "Menlo:h12"
set.guifont = "Meslo:h12"
--set.guifont = "Mono:h12"
set.syntax = "ON"
set.termguicolors = true
--set.background = dark
set.titlestring = vim.fn.expand("%:~:p:h") -- TODO what is :h
cmd("filetype plugin on") -- for markdown plugin
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- [[ zen mode ]]
cmd("let g:vim_markdown_folding_disabled = 1") -- for open folding on active markdown file
