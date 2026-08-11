return {
	"3rd/diagram.nvim",
	ft = { "markdown" },
	dependencies = {
		{
			"3rd/image.nvim",
			opts = {
				-- Ghostty speaks the kitty graphics protocol.
				backend = "kitty",
				-- Uses the `magick` CLI from homebrew imagemagick,
				-- so no luarock build step is needed.
				processor = "magick_cli",
				integrations = {
					-- diagram.nvim owns the markdown buffer; keep image.nvim's
					-- own markdown handler off so the two don't both draw.
					markdown = { enabled = false },
					neorg = { enabled = false },
				},
				max_width_window_percentage = 80,
				window_overlap_clear_enabled = true,
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "" },
			},
		},
	},
	-- opts must be a function: the integration is `require`d from the plugin
	-- itself, which is not on the runtimepath until after lazy loads it.
	opts = function()
		return {
			integrations = {
				require("diagram.integrations.markdown"),
			},
			renderer_options = {
				mermaid = {
					theme = "dark",
					background = "transparent",
				},
			},
		}
	end,
	keys = {
		{
			";M",
			function()
				require("diagram").show_diagram_hover()
			end,
			mode = "n",
			ft = { "markdown" },
			desc = "Diagram in new tab",
		},
	},
}
