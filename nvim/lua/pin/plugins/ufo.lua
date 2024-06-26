return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		local ufo = require("ufo")

		---@diagnostic disable-next-line: missing-fields
		ufo.setup({
			fold_virt_text_handler = handler,
			--set_foldtext = true,
		})

		local keymap = vim.keymap
		keymap.set("n", "zR", ":lua require('ufo').openAllFolds()<CR>", { desc = "Open all folds" })
		keymap.set("n", "zM", ":lua require('ufo').closeAllFolds()<CR>", { desc = "Close all folds" })

		-- tobble fold column
		local is_fold_column_show = false
		keymap.set("n", ";tf", function()
			if is_fold_column_show then
				vim.cmd(":set foldcolumn=0")
			else
				vim.cmd(":set foldcolumn=1")
			end

			is_fold_column_show = not is_fold_column_show
		end, { desc = "toggle fold column" })
	end,
}
