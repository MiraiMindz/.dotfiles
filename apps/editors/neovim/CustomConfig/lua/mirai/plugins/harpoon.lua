local M = {}

M.opts = {
    tabline = true,
}

M.keys = {
    { 'n', '<leader>f', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Toggle harpoon menu" },
    {
        'n',
        '<leader>a',
        '<cmd>lua require("harpoon.mark").toggle_file()<cr>',
        desc =
        "Add file to harpoon list"
    },
}

return M
