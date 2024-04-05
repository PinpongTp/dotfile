local fidget_ok, fidget = pcall(require, "fidget")
if not fidget_ok then
	return
end

fidget.setup({
	text = {
		spinner = "pipe", -- animation shown when tasks are ongoing
		done = "✔", -- character shown when all tasks are complete
		commenced = "Started", -- message shown when task starts
		completed = "Completed", -- message shown when task completes
	},
	window = {
		relative = "win", -- where to anchor, either "win" or "editor"
		blend = 0, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
		border = "none", -- style of border for the fidget window
	},
	fmt = {
		leftpad = true, -- right-justify text in fidget box
		stack_upwards = true, -- list of tasks grows upwards
		max_width = 0, -- maximum width of the fidget box
		-- function to format fidget title
		fidget = function(fidget_name, spinner)
			return string.format("%s %s", spinner, fidget_name)
		end,
		-- function to format each task line
		task = function(task_name, message, percentage)
			return string.format(
				"%s%s [%s]",
				message,
				percentage and string.format(" (%s%%)", percentage) or "",
				task_name
			)
		end,
	},
	debug = {
		logging = false,
		strict = false,
	},
})
