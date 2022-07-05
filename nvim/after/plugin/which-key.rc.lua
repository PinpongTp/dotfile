if true then
  local status, wk = pcall(require, "which-key")
  if (not status) then return end

  wk.setup {spelling = {enable = false, suggestions = 20}}

  wk.register({
    ["<Leader>"] = {
      c = {name = "+NERDCommant"},
      t = {name = "+TAB"},
      b = {name = "+BUFFER"}
    }
  })
end
