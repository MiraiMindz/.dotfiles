print("LOADED MIRAI/PLUGINS UI.lua")

local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
    },
    {
        'echasnovski/mini.cursorword',
        version = false
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
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            require("nvim-ufo").setup({}) -- !IMPORTANT ERROR
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'MunifTanjim/nui.nvim',
        config = function()
            require("nui").setup({}) -- !IMPORTANT ERROR
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup()
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require("nvim-web-devicons").setup()
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup()
        end
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require("dressing").setup()
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").setup({}) -- !IMPORTANT ERROR
        end
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup({})
        end
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup(require("mirai.plugins.hlchunk"))
        end
    },
    {
        'Bekaboo/dropbar.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        lazy = false,
    }
}

return plugins
