---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
    ["<leaderm>"] = {":Glow!<CR>", "Renders the current Markdown file using Glow", opts = { nowait = true }},
    ["<leader>t"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  },
  i = {
    ["<C-BS>"] = {"<Esc>cvb", "Deletes entire words", opts = { noremap = true }},
  },
}

return M
