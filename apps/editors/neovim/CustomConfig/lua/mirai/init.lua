--[[
    This file is the initial one, the first file that is loaded by neovim the
    order used by this file matters as it loaded top-to-bottom.

    Base:
        This module contains any basic pure-vim/neovim config, and defines the
        primitive/standard behaviour of the editor.

    Plugins:
        This module loads the plugin table to be used with the Lazy.nvim plugin
        manager, I prefer the table method over the folder one because I can
        split my plugins based on certain criterias.
        refer to: https://github.com/folke/lazy.nvim#-structuring-your-plugins

    Keymap:
        This is my global keymap config, it defines all of my keybinds, for the
        editor and the plugins, thus, it need to be loaded before the plugins.

    Post:
        As the name suggests, this file contains any post configuration that
        relies on plugins, thus being needed to be loaded before them.

--]]

require("mirai.base")
local plugins = require("mirai.plugins")

-- Configures the Lazy NeoViM Plugin Manager
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
