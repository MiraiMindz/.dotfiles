local utils = require("mirai.utils")

local function createcmd(command)
    return utils.cmdstr("Telescope " .. command)
end

local M = {}

M.config = {
    extensions = {
        undo = require("mirai.plugins.telescopeUndo").config,
    }
}

M.keys = {
    -- {"<leader>ff", utils.cmdstr("Telescope find_files"), desc = "Find Files" },
    { "<C-f>", createcmd("find_files"), desc = "Find Files" },
    { "<C-b>", createcmd("git_files"),  desc = "Find Git Files" },
    { "<C-g>", createcmd("live_grep"),  desc = "Grep through project" },
}

return M
