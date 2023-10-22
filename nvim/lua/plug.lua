-- start up --
return {
	-- for tmux navigator
	{ "christoomey/vim-tmux-navigator" },
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("smart-splits").setup({
				resize_mode = {
					quit_key = "q",
				},
			})
		end,
	},

	-- colorsheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1001,
		config = function()
			-- load tho colorsheme here
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				transparent_sidebar = true,
				dim_inactive = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			--[[vim.cmd.colorscheme("tokyonight")]]
		end,
	},
	{
		"PinpongTp/eva01.vim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("eva01")
		end,
	},
	{
		"PinpongTp/comic",
		--dir = "~/Developer/theme/vim/comic",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("comic")
		end,
	},
	{
		"yassinebridi/vim-purpura",
		lazy = false,
	},

	{
		"pgdouyon/vim-yin-yang",
		priority = 1001,
		config = function()
			--vim.cmd.colorscheme("yin")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				style = {
					comments = { "italic" },
				},
				integrations = {
					cmp = true,
					nvimtree = true,
					indent_blankline = { enabled = true, colored_indent_levels = false },
				},
			})
			--require("catppuccin").compile()
			--vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "patstockwell/vim-monokai-tasty" },
	{ "dracula/vim", priority = 1000, name = "dracula" },
	{ "axvr/photon.vim" },
	{ "preservim/vim-colors-pencil" },

	-- theme
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "140",
			scope = "file",
			disabled_filetypes = { "help", "text", "markdown", "NvimTree", "lazy", "mason", "help", "alpha" },
		},
	},
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch()
			end, {})
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, {})
		end,
	},

	-- show color
	{
		--"norcalli/nvim-colorizer.lua",
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- rest client
	{
		"NTBBloodbath/rest.nvim",
		config = function()
			require("rest-nvim").setup()
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	--use { 'PinpongTp/rest.nvim', branch = 'main' }
	--'~/Developer/my/nvim/plugins/rest.nvim',

	-- landing page
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- zen mode
	{
		"folke/zen-mode.nvim",
		lazy = true,
		dependencies = {
			"preservim/vim-markdown",
			"junegunn/limelight.vim",
		},
	},

	-- nvimtree
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"kyazdani42/nvim-tree.lua",
			dependencies = {
				"kyazdani42/nvim-web-devicons",
			},
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	-- status bar
	"hoob3rt/lualine.nvim",
	-- buffer
	"kdheepak/tabline.nvim",

	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "nvimdev/lspsaga.nvim" },
			{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
			{ "onsails/lspkind-nvim" },
			{ "RRethy/vim-illuminate" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			--'f3fora/cmp-spell',
			--'hrsh7th/cmp-calc',
			--'ray-x/cmp-treesitter',
			--'uga-rosa/cmp-dictionary',

			-- LSP Support
			{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" }, -- show lsp status right buttom
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
			},

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					-- check what is this
					"rafamadriz/friendly-snippets", -- Optional
				},
			}, -- Required
		},
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				keys = {
					{
						"<leader>du",
						function()
							require("dapui").toggle({})
						end,
						desc = "Dap UI",
					},
					{
						"<leader>de",
						function()
							require("dapui").eval()
						end,
						desc = "Eval",
						mode = { "n", "v" },
					},
				},
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end

					vim.fn.sign_define("DapBreakpoint", { text = "🔺", texthl = "", linehl = "", numhl = "" })
					vim.fn.sign_define("DapBreakpointRejected", { text = "🔹", texthl = "", linehl = "", numhl = "" })
					vim.fn.sign_define("DapStopped", { text = "🦄", texthl = "", linehl = "", numhl = "" })
				end,
			},

			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},

			-- mason.nvim integration
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
		},
		keys = {
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Breakpoint Condition",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				";b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>dg",
				function()
					require("dap").goto_()
				end,
				desc = "Go to line (no execute)",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>dj",
				function()
					require("dap").down()
				end,
				desc = "Down",
			},
			{
				"<leader>dk",
				function()
					require("dap").up()
				end,
				desc = "Up",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause()
				end,
				desc = "Pause",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>ds",
				function()
					require("dap").session()
				end,
				desc = "Session",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>dw",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Widgets",
			},
			{
				"<leader>da",
				function()
					require("plugin_configs.dap.debugHelper").attach()
				end,
			},
		},
		--[[config = function()
			local Config = require("lazyvim.config")
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			for name, sign in pairs(Config.icons.dap) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
				)
			end
		end,]]
	},

	--"nvim-lua/completion-nvim",
	--"nvim-telescope/telescope-dap.nvim",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground", -- TD: maybe not use

			-- tab and fold
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag", -- setup in treesitter
			"tpope/vim-surround",
		},
	},
	{

		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({
				keymaps = {
					hover_symbol = "K",
					--toggle_preview = "",
					-- TODO: update pluging and check preview function
				},
			})
		end,
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		opts = {
			left = {
				{
					ft = "NvimTree",
					open = "NvimTreeOpen",
				},
				{
					ft = "Outline",
					open = "SymbolsOutlineOpen",
				},
				{
					ft = "Outline saga",
					open = "lspsaga outline",
				},
				{
					ft = "NavBuddy",
					open = "Navbuddy",
				},
			},
			bottom = {},
			right = {},
			top = {},
			options = {
				left = { size = 35 },
				bottom = {},
				right = {},
				top = {},
			},
			animate = {
				enabled = false,
			},
			exit_when_last = true,
			keys = {
				["<C-Right>"] = function(win)
					win:resize("width", 2)
				end,
				["<C-Left>"] = function(win)
					win:resize("width", -2)
				end,
				["<C-Up>"] = function(win)
					win:resize("height", 2)
				end,
				["<C-Down>"] = function(win)
					win:resize("height", -2)
				end,
			},
		},
		keys = {
			{
				"<leader>p",
				function()
					require("edgy").toggle()
				end,
				desc = "Toggle Edgy",
			},
		},
	},

	-- for move
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup()
		end,
	},

	-- telescope
	"nvim-lua/popup.nvim",
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- for use format and eslint
	"jose-elias-alvarez/null-ls.nvim",
	"eslint/eslint",

	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- copilot
	--[[{
		"github/copilot.vim",
	},]]
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	-- Lazy
	--[[{
		"jackMort/ChatGPT.nvim",
		config = function()
			local home = vim.fn.expand("$HOME")
			require("chatgpt").setup({
				api_key_cmd = "gpg -d --passphrase abcd " .. home .. "/.config/nvim/secrets/chatgpt-api-key.txt.gpg",
				edit_with_instructions = {
					diff = false,
					keymaps = {
						close = "<C-c>",
						accept = "<C-y>",
						toggle_diff = "<C-d>",
						toggle_settings = "<C-o>",
						cycle_windows = "<Tab>",
						use_output_as_input = "<C-i>",
					},
				},
			})
		end,
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},]]

	-- helper
	"akinsho/toggleterm.nvim",

	{
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
	},

	"voldikss/vim-floaterm",
	{ "folke/which-key.nvim", lazy = false },
	"kshenoy/vim-signature",
	"lukas-reineke/indent-blankline.nvim", -- indentline

	-- commenter
	"preservim/nerdcommenter",
	"folke/todo-comments.nvim",

	-- language
	-- go
	"fatih/vim-go",
	-- csv
	"tyru/open-browser.vim",
	"weirongxu/plantuml-previewer.vim",

	-- list for research
	--"andymass/vim-matchup",
	--"ray-x/lsp_signature.nvim",
	--"Wansmer/treesj"
}
