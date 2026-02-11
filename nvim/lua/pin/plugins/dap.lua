return {
	{
		"igorlfs/nvim-dap-view",
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				node2 = function(config)
					config.adapter = {
						type = "executable",
						command = vim.fn.exepath("node-debug2-adapter"),
					}
					config.configurations = {
						{
							name = "node2 my attach",
							type = "node2",
							request = "attach",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							skipFiles = { "<node_internals>/**", "node_modules/**" },
						},
					}
					require("mason-nvim-dap").default_setup(config)
				end,
			},
			ensure_installed = { "node2" },
		},
	},
}
