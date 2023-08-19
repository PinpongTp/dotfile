if true then
	local status, wk = pcall(require, "which-key")
	if not status then
		return
	end
	local show = wk.show
	wk.show = function(keys, opts)
		if vim.bo.filetype == "TelescopePrompt" then
			print(keys)
			print(opts)
		end
		show(keys, opts)
	end

	wk.setup({ spelling = { enable = false, suggestions = 20 }, default_mode = "n" })

	wk.register({
		["<Leader>"] = {
			e = { name = "Exp" },
			c = { name = "+Commant" },
			t = { name = "+Tab" },
			b = { name = "+Buffer" },
			s = { name = "+Saga" },
			f = { name = "+FindText" },
		},
		[";"] = {
			f = { name = "Find & Telescope", f = { "find file" }, l = { "live grep" } },
			t = {
				name = "Toggle",
				g = { "git signs" },
				n = { "line numbers" },
				i = { "indent lines" },
				t = { "floaterm" },
			},
		},
	})
end
