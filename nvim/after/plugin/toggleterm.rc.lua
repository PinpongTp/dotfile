local status, tg = pcall(require, "toggleterm")
if (not status) then return end

tg.setup {
  open_mapping = [[<c-\>]],

  shade_terminals = true,
  close_on_exit = true,
  direction = "float",
  float_opts = {
    border = "curved",
    whiblend = 0,
    highlights = {border = "Normal", backgroud = "Normal"}
  }
}

