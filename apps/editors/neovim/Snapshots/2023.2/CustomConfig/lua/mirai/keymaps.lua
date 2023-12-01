--[[

    This file contains all of my keymaps and keybindings
    They are separated by sections of the main table.

--]]

local utils = require("mirai.utils")

-- This function dinamically creates 9 keymaps for me to jump to harpoon files.
local function setHarpoonJumps()
    for pos = 1, 9 do
        vim.keymap.set("n", "<C-w>" .. pos, function()
            require("harpoon.ui").nav_file(pos)
        end, { desc = "Move to harpoon mark #" .. pos })
    end
end

local M = {}

function M.getHarpoonJumps()
    return setHarpoonJumps
end

M.harpoon = {
    {
        '<leader>f',
        utils.cmdstr('lua require("harpoon.ui").toggle_quick_menu()'),
        desc = "Toggle harpoon menu"
    },
    {
        '<leader>a',
        utils.cmdstr('lua require("harpoon.mark").toggle_file()'),
        desc = "Add file to harpoon list"
    },
}

--[[
    Litte disclaimer, for some reason, splitting the keymaps from the cmp config
    doesn't work, probably because they are loaded before the cmp plugin itself
    so these keybinds are moved to mirai/plugins/cmp to resolve this issue.
--]]


-- M.cmp = {
--     ['<Tab>'] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--             cmp.confirm({ select = true })
--         else
--             fallback()
--         end
--     end, { 'i', 'c' }),
--     ['<C-e>'] = cmp.mapping({
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--     }),
--     ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
--         behavior = cmp.SelectBehavior.Select
--     }), { 'i', 'c' }),
--     ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
--         behavior = cmp.SelectBehavior.Select
--     }), { 'i', 'c' }),
-- }

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


return M
