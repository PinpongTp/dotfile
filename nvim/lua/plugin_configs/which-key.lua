if true then
  local status, wk = pcall(require, "which-key")
  if (not status) then return end
  local show = wk.show
  wk.show = function(keys, opts)
    if vim.bo.filetype == "TelescopePrompt" then
      print(keys)
      print(opts)
    end
    show(keys, opts)
  end

  wk.setup { spelling = { enable = false, suggestions = 20 }, default_mode = 'n' }

  wk.register({
    ["<Leader>"] = {
      c = { name = "+NERDCommant" },
      t = { name = "+TAB" },
      b = { name = "+BUFFER" }
    },
  })
end
