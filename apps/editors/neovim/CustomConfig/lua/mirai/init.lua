--[[ This is the first file to be loaded from the module, It will load the
the others files and the plugin manager, which in this case will be lazy.nvim
the order of loading matters a little bit.

THE BASE SECTION:
It contains basic vim/neovim configs, it's defines the editor's basic behaviour.

THE PLUGINS SECTION:
It contains all of the plugins used and imported by the plugin manager.

THE KEYMAPS SECTION:
As the name implies, it contains all of my keybinds.

THE POST SECTION:
Contains all of post-plugins-inports configs.
--]]

print("#00 MAIN MODULE LOADED /lua/mirai/init.lua")

local CONFIG_DIR = "mirai"
local SECTIONS = {
	BASE = CONFIG_DIR .. ".base",
	PLUGINS = CONFIG_DIR .. ".plugins",
	KEYMAPS = CONFIG_DIR .. ".keymaps",
	POST = CONFIG_DIR .. ".post",
}

require(SECTIONS.BASE)
-- Lazy.nvim Plugins Table
local lazyPlugins = require(SECTIONS.PLUGINS)

-- Setting up lazy.nvim
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

require("lazy").setup(lazyPlugins)
require(SECTIONS.KEYMAPS)
require(SECTIONS.POST)

