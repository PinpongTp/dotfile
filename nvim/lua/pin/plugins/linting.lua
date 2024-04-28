return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- css = { "stylelint" },
			-- html = { "htmlhint" },
			-- json = { "jsonlint" },
			-- yaml = { "yamllint" },
			-- markdown = { "markdownlint" },
			-- lua = { "luacheck" },
			-- python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
