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
			c = { name = "+Commant" },
			t = { name = "+Tab" },
			b = { name = "+Buffer" },
			s = { name = "+Saga" },
			f = { name = "+FindText" },
		},
		[";"] = {
			f = { name = "+Find & Telescope" },
			t = { name = "+Toggle & Terminal" },
		},
	})
end
