return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			-- Basic debugging controls
			{
				";db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				";dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Breakpoint Condition",
			},
			{
				";dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				";dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				";di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				";do",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				";dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				";dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				";dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
		},
	},
	{
		"igorlfs/nvim-dap-view",
		dependencies = { "mfussenegger/nvim-dap" },
		keys = {
			{
				";dv",
				function()
					require("dap-view").toggle()
				end,
				desc = "Toggle DAP View",
			},
			{
				";ds",
				function()
					require("dap-view").toggle_scopes()
				end,
				desc = "Toggle Scopes",
			},
			{
				";dS",
				function()
					require("dap-view").toggle_stack()
				end,
				desc = "Toggle Stack Trace",
			},
			{
				";dw",
				function()
					require("dap-view").toggle_watches()
				end,
				desc = "Toggle Watches",
			},
			{
				";dx",
				function()
					require("dap-view").toggle_breakpoints()
				end,
				desc = "Toggle Breakpoints List",
			},
			{
				"]b",
				function()
					local breakpoints = require("dap.breakpoints").get()
					local current_buf = vim.api.nvim_get_current_buf()
					local current_line = vim.api.nvim_win_get_cursor(0)[1]

					-- Get breakpoints in current buffer
					local buf_breakpoints = {}
					for buf, bps in pairs(breakpoints) do
						if buf == current_buf then
							for _, bp in ipairs(bps) do
								table.insert(buf_breakpoints, bp.line)
							end
						end
					end

					-- Sort breakpoints
					table.sort(buf_breakpoints)

					-- Find next breakpoint
					for _, line in ipairs(buf_breakpoints) do
						if line > current_line then
							vim.api.nvim_win_set_cursor(0, { line, 0 })
							return
						end
					end

					-- Wrap to first breakpoint
					if #buf_breakpoints > 0 then
						vim.api.nvim_win_set_cursor(0, { buf_breakpoints[1], 0 })
					end
				end,
				desc = "Next Breakpoint",
			},
			{
				"[b",
				function()
					local breakpoints = require("dap.breakpoints").get()
					local current_buf = vim.api.nvim_get_current_buf()
					local current_line = vim.api.nvim_win_get_cursor(0)[1]

					-- Get breakpoints in current buffer
					local buf_breakpoints = {}
					for buf, bps in pairs(breakpoints) do
						if buf == current_buf then
							for _, bp in ipairs(bps) do
								table.insert(buf_breakpoints, bp.line)
							end
						end
					end

					-- Sort breakpoints in reverse
					table.sort(buf_breakpoints, function(a, b)
						return a > b
					end)

					-- Find previous breakpoint
					for _, line in ipairs(buf_breakpoints) do
						if line < current_line then
							vim.api.nvim_win_set_cursor(0, { line, 0 })
							return
						end
					end

					-- Wrap to last breakpoint
					if #buf_breakpoints > 0 then
						vim.api.nvim_win_set_cursor(0, { buf_breakpoints[1], 0 })
					end
				end,
				desc = "Previous Breakpoint",
			},
		},
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			ensure_installed = { "node2" },
			handlers = {
				-- Default handler for all adapters
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,

				-- Custom Node.js debugger configuration
				node2 = function(config)
					config.adapter = {
						type = "executable",
						command = vim.fn.exepath("node-debug2-adapter"),
					}

					config.configurations = {
						{
							name = "Attach to Node Process",
							type = "node2",
							request = "attach",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							skipFiles = {
								"<node_internals>/**",
								"node_modules/**",
							},
						},
					}

					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
	},
}
