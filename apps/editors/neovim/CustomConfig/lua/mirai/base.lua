--[[

--]]

-- print("#01 BASE MODULE LOADED /lua/mirai/base.lua")

-- Sets the <SPACE> key as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Enable GUI Colors.
vim.o.termguicolors = true

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

-- Enables SwapFiles
vim.opt.swapfile = true

-- Disables Backups
vim.opt.backup = false

-- Enables Undo-dir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enables incremental highlight
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- Ensures that has at least 8 lines at bottom or top of screen.
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Highlight the 80th column (good for formatting)
vim.opt.colorcolumn = "80"

-- Shows the command
vim.opt.showcmd = false

-- Remove bottom command line
vim.opt.cmdheight = 0

-- Auto Resizes window
vim.api.nvim_create_autocmd("VimResized", { pattern = "*", command = "tabdo wincmd =" })

-- Make the arrow keys go to next or previous line.
vim.cmd([[set whichwrap+=<,>,[,] ]])

-- Format on save
-- MOVED TO POST.lua to use CONFORM
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

-- This enables inlay_hints on LSP in case it fails to load on the plugin conf.
--vim.g.inlay_hints_visible = true
--vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(nil))
-- -- vim.lsp.inlay_hint(0, true)

-- Enables autosaving
vim.cmd("set autowriteall")
vim.api.nvim_create_autocmd("TextChanged", { pattern = "<buffer>", command = "silent write" })
vim.api.nvim_create_autocmd("TextChangedI", { pattern = "<buffer>", command = "silent write" })

-- Sync current directory and browsing directory
vim.g.netrw_browse_split = 0

-- Disables banner
vim.g.netrw_banner = 0

-- Sets the window to be 30% of screen
vim.g.netrw_winsize = 30

-- Changes the copy command to be recursive
vim.g.netrw_localcopydircmd = "cp -r"

-- Enable filetype plugins
vim.cmd("filetype plugin on")

-- Enables OmniFunction AutoComplete
vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Enables blinking cursor in insert mode
vim.api.nvim_command("set guicursor+=a:blinkon1")

-- Enables current line number coloring
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- vim: ts=4 sts=4 sw=4 et nu rnu si scs sms spell title
