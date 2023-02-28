if not pcall(require, "luasnip") then
	return
end

local types = require("luasnip.util.types")
local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = { [types.choiceNode] = { active = { virt_text = { { "<- choice", "Comment" } } } } },
})

local opts = { silent = true }
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, opts)
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, opts)
vim.keymap.set({ "i" }, "<c-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, opts)
vim.keymap.set({ "i" }, "<c-u>", require("luasnip.extras.select_choice"), opts)

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local p = require("luasnip.extras").partial
local fmt = require("luasnip.extras.fmt").fmt
--local m = require("luasnip.extras").m
--local lambda = require("luasnip.extras").l
--local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets("all", {
	s("bang", t("#!/usr/bin/env ")),
	--s("date", p(os.date, "%d.%m.%Y")),
	s("ternary", {
		i(1, "cond"),
		t(" ? "),
		i(2, "then"),
		t(" : "),
		i(3, "else"),
	}),
	s("trigger", {
		t({ "Wow! Text!", "And another line." }),
	}),
})

local mySnippet = {
	s("fire", { t("console.log('🔥', "), i(1, ""), t(")") }),
}

ls.add_snippets("javascript", mySnippet)
ls.add_snippets("typescript", mySnippet)
