local M = {
    chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        style = "#45475a",
    },
    indent = {
        enable = false,
    },
    line_num = {
        enable = false,
        style = "#cba6f7",
    },
    blank = {
        enable = false,
    },
}

return M
