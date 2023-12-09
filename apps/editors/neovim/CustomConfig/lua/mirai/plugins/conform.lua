local M = {
    -- Define your formatters
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
    },
}

return M
