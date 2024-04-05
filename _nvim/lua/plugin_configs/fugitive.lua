local status, fugitive = pcall(require, "tpope/vim-fugitive")
if (not status) then return end

fugitive.setup {}
