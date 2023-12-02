local M = {
    ensure_installed = require("mirai.lsp").treesitter_ensure_installed,
    tree_docs = {enable = true},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = {
        enable = true,
    }
}

return M
