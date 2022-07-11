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
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
