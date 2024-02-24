local M = {}

M.config = {
    extensions = {
        undo = require("mirai.plugins.telescopeUndo").config,
        fzf = require("mirai.plugins.telescopeFzf").config,
    }
}

return M
