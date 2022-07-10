-- my init.lua file --
print('debug test')

--local packer = require('packer')

local ok, parker = pcall(require, "packer")
if not ok then
  print("can't get parker")
  return 
end

parker.init (
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
)

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


end)
