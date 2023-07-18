local M = {
    ensure_installed = require("mirai.lsp").ts_ensure_installed,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = {
        enable = true,
    }
}

return M
