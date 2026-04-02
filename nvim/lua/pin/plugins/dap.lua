return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local dap = require("dap")
			local js_debug_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { js_debug_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
				},
			}

			local js_config = {
				{
					name = "Launch Node",
					type = "pwa-node",
					request = "launch",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
				{
					name = "Attach to Node Process",
					type = "pwa-node",
					request = "attach",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
			}

			dap.configurations.javascript = js_config
			dap.configurations.typescript = js_config

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DiagnosticWarn", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "●", texthl = "DiagnosticHint", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticError", linehl = "DapStoppedLine", numhl = "DiagnosticError" })
		end,
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
					require("dap").repl.toggle(nil, "belowright split")
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
}
