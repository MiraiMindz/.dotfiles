--[[

--]]

-- These are some overwritten remaps
-- First we remove the default ones
vim.api.nvim_set_keymap('n', 'h',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', 'j',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', 'k',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', 'l',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', 'h',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', 'j',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', 'k',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', 'l',       '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', '<C-h>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', '<C-j>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', '<C-k>',   '<Nop>',    {noremap = true})
vim.api.nvim_set_keymap('v', '<C-l>',   '<Nop>',    {noremap = true})

-- And Re-assign them
vim.api.nvim_set_keymap('n', '<Up>',    'k',        {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>',  'j',        {noremap = true})
vim.api.nvim_set_keymap('n', '<Left>',  'h',        {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', 'l',        {noremap = true})

-- This sets the default File Explorer to <Ctrl> + n
-- vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

