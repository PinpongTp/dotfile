if vim.loader then
	vim.loader.enable()
end

-- Automatically install lazypath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local spec = require("plug")

-- load require packer --
require("vars") -- Variables
require("keys") -- Keymaps

local Lazy = require("lazy")
Lazy.setup({
	spec = spec,
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("opts") -- Options
require("plugin_configs") -- Plugins configs autoload
