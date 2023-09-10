local cmp_status_ok, cmp = pcall(require, "cmp")
local window = require("ui.window")
if not cmp_status_ok then
	return
end
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		--[[["<C-l>"] = cmp.mapping.complete(),
		["<C-q>"] = cmp.mapping.close(),]]
		--[[["<C-e>"] = cmp.mapping.about(),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "s" }),]]
		--[[["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1) else fallback() end
		end, { "i", "s" }),]]
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),

	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			maxwidth = 50,
			before = function(entry, item)
				local menu_icon = {
					nvim_lsp = "[Lsp]",
					luasnip = "[Snp]",
					buffer = "[Buf]",
					path = "[Pat]",
				}
				item.menu = menu_icon[entry.source.name]
				return item
			end,
		}),
	},
	window = {
		completion = cmp.config.window.bordered(window),
		documentation = cmp.config.window.bordered(window),
	},
})

--winhighlight = "NormalFloat:Pmenu,FloatBorder:Pmenu,CursorLine:NormalFloat",
--vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
