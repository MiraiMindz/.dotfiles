---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = {":", "Enters command mode", opts = {nowait = true}},
    ["<leaderm>"] = {":Glow!<CR>", "Renders the current Markdown file using Glow", opts = {nowait = true}},
  }
}

return M
