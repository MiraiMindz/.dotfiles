--[[ This is the third iteration of my neovim config, named: The Single One.
This time my entire config will be a single file that contains everything.

Why am I doing this? Because I've reseted my system and had gone to a minimal
approach, thus this config will be minimal too.

Hope you enjoy it.
                                                                        - Mirai
--]]

-- BASE SECTION

-- Sets the colorscheme to be one of the defauts
-- I've choosed wildcharm cuz looked like an ANSI theme.
vim.cmd.colorscheme("wildcharm")

-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.wo.number = true

-- Sets the map key to the <space> key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- I do not have a nerd font.
vim.g.have_nerd_font = false

-- Enables the mouse
vim.opt.mouse = 'a'

-- Disables showing the mode (because it's on the status line)
vim.opt.showmode = false

-- Sync OS & nvim clipboards
vim.opt.clipboard = 'unnamedplus'

-- Set highlight on search
vim.o.hlsearch = false

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

-- This enables inlay_hints on LSP in case it fails to load on the plugin conf.
vim.g.inlay_hints_visible = true

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

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will show the spaces.
vim.opt.list = true
vim.opt.listchars = { tab = '>> ', trail = '·', nbsp = '␣' }

-- Realtime substitution preview
vim.opt.inccommand = 'split'

-- AUTOCOMMANDS

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- PLUGINS



-- POST SECTION


-- MODELINE
-- vim: ts=4 sts=4 sw=4 et nu rnu si scs sms spell title
