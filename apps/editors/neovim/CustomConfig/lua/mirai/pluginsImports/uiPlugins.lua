local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = require("mirai.plugins.catppuccin")
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("noice").setup(require("mirai.plugins.noice"))
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup(require("mirai.plugins.notify"))
        end,
    },
    {
        'Bekaboo/dropbar.nvim',
        lazy = false,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup(require("mirai.plugins.dashboard"))
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = function()
            require("lualine").setup(require("mirai.plugins.lualine"))
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "shellRaining/hlchunk.nvim",
        event = "UIEnter",
        config = function()
            require("hlchunk").setup(require("mirai.plugins.hlchunk"))
        end,
    },
}

return plugins
