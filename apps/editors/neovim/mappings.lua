---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>m"] = {":Glow!<CR>", "Render the current Markdown file using Glow", opts = {nowait = true} },
    -- ["<leader>mm"] = {":Glow!<CR>", "Disables the Glow Rendering", opts = {nowait = true} },
  },
}

-- more keybinds!

return M
