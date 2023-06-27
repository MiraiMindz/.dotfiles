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
    ["<F6>"] = {":CompilerOpen<CR>", "Opens a compiler", opts = { noremap = true, silent = true }},
    ["<S-F6>"] = {":CompilerToggleResults<CR>", "Opens the compiling results", opts = { noremap = true, silent = true }},

  },
  i = {
    ["<C-BS>"] = {"<Esc>cvb", "Deletes entire words", opts = { noremap = true }},
  },
}

return M
