local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local M = {}

-- M.keys = {}

M.keys = {
    {"n", "<C-a>", mark.add_file, desc = "Add the current file to the Harpoon list"},
    {"n", "<C-e>", ui.toggle_quick_menu, desc = "Toggles the Harpoon menu"},
    {"n", "\\+z", function() ui.nav_file(1) end, desc = ""},
    
}

return M
