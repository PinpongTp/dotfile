return {
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		opts = {
			-- ปรับได้ตามชอบ (default_amount คือจำนวนช่องที่ขยาย/ย่อ ต่อ 1 ครั้ง)
			default_amount = 5,
			at_edge = "wrap",
		},
		dependencies = {
			"pogyomo/submode.nvim",
		},
		config = function(_, opts)
			local ss = require("smart-splits")
			ss.setup(opts)

			local submode = require("submode")

			submode.create("WinResize", {
				mode = "n",
				enter = "<leader>S",
				leave = { "<Esc>", "q", "<C-c>" },
				default = function(register)
					register("h", ss.resize_left, { desc = "Resize left" })
					register("j", ss.resize_down, { desc = "Resize down" })
					register("k", ss.resize_up, { desc = "Resize up" })
					register("l", ss.resize_right, { desc = "Resize right" })

					-- เผื่ออยากใช้ลูกศรด้วย
					register("<Left>", ss.resize_left, { desc = "Resize left" })
					register("<Down>", ss.resize_down, { desc = "Resize down" })
					register("<Up>", ss.resize_up, { desc = "Resize up" })
					register("<Right>", ss.resize_right, { desc = "Resize right" })
				end,
			})
		end,
	},
}
