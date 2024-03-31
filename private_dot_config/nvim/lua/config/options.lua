-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Enable WildMenu
-- vim.o.wildmenu = true
-- vim.o.wildmenu = "full"

-- tab is 4 spaces width
vim.o.shiftwidth = 4
vim.o.tabstogp = 4

-- show tabline
vim.o.showtabline = 1

-- show indent line
vim.o.list = true
vim.o.listchars = "tab:▸ ,trail:·,nbsp:␣"

-- column limit
vim.o.textwidth = "80"
