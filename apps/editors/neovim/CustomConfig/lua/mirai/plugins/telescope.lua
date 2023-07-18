local M = {}

M.config = {
    extensions = {
        undo = require("mirai.plugins.telescopeUndo").config,
    }
}

return M
