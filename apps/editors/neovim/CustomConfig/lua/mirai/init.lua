--[[
This is my custom neovim config from scratch

The imports (file structure) explained:
	Base: 
		Contains everything that is basic to nvim \
		like tab sizes, leader key and other sets.
	Keymaps: 
		As the name suggests, it contains all of \
		my keymaps and keybindings.
--]]

require("mirai.base")

local plugins = require("mirai.plugins")

-- Configures the Lazy NeoVIM Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

require("mirai.keymaps")
require("mirai.post")

