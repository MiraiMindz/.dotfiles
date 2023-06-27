local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "#313244",
    bg = "NONE",
    blend = 100,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
