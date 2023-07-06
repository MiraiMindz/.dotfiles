--[[

    Thanks to ThePrimeagen for some of these configs.
--]]

-- This sets the master/leader key to the <space> key.
vim.g.mapleader = " "

-- This toggles hybrid line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- This enables 4 spaces tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart identation
vim.opt.smartindent = true

-- Disables backup but enables the undotree to have insane times
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable global highlight and enables incremental highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- Ensures that has at least 8 lines at bottom or top of screen.
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Changes the NeoVim update time
vim.opt.updatetime = 50

-- Highlight the 80th column (good for formatting)
vim.opt.colorcolumn = "80"

vim.opt.showcmd = true

