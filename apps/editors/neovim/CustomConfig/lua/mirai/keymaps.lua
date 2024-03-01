-- print("#02 KEYMAPS MODULE LOADED /lua/mirai/keymaps.lua")

local utils = require("mirai.utils")
local M = {}

M.telescope = {
    { "<C-f>", utils.cmdstr("Telescope find_files"), desc = "Find Files" },
    { "<C-b>", utils.cmdstr("Telescope git_files"),  desc = "Find Git Files" },
    { "<C-g>", utils.cmdstr("Telescope live_grep"),  desc = "Grep through project" },
}


M.telescopeUndo = {
    {
        "n",
        "<leader>y",
        utils.cmdstr("lua require('telescope-undo.actions').yank_additions"),
        desc = "Yank undo addittions"
    },
}

M.flash = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
}

M.neogen = {
    { "<leader>gc", utils.luacmdstr("require('neogen').generate({ type = 'class' })"), desc = "Generates Classes Notations" },
    { "<leader>gf", utils.luacmdstr("require('neogen').generate({ type = 'func' })"),  desc = "Generates Functions Notations" },
    { "<leader>gt", utils.luacmdstr("require('neogen').generate({ type = 'type' })"),  desc = "Generates Types Notations" },
}


return M
