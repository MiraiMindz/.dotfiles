local M = {}

M.config = {
    use_delta = true,
    use_custom_command = nil,
    diff_context_lines = vim.o.scrolloff,
    entry_format = "state #$ID, $STAT, $TIME",
    time_format = "",
    side_by_side = true,
    layout_strategy = "vertical",
    layout_config = {
        preview_height = 0.8,
    },
}

return M
