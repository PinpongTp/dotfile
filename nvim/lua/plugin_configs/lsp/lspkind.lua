local status, lspkind = pcall(require, "lspkind")
local icons = require("ui.icons")
if not status then
	return
end

lspkind.init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = icons,
})
