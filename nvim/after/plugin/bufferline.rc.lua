if false then
  local status, bufferline = pcall(require, "bufferline")
  if (not status) then return end

  bufferline.setup {
    options = {
      -- mode = "tabs",
      number = "ordinal",
      -- indicator_icon = '',
      indicator_icon = '▎',
      left_trunc_marker = "",
      right_trunc_marker = ""
    }
  }
end
