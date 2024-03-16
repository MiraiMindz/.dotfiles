-- This file contains all the plugins that add functionalities to the editor

local CONFIG_BASE_DIR = "mirai.plugins."

local M = {
    {
        "mrjones2014/legendary.nvim",
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        dependencies = { "kkharji/sqlite.lua" },
        config = function()
            require("legendary").setup({ extensions = { lazy_nvim = { auto_register = true } } })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-tree-docs",
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup(require(CONFIG_BASE_DIR .. "treesitter"))
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    -- {
    --    'tzachar/fuzzy.nvim',
    --    dependencies = {
    --        'nvim-telescope/telescope-fzf-native.nvim'
    --    },
    --    config = function()
    --        require("fuzzy_nvim").setup({})
    --    end
    -- },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        keys = require("mirai.keymaps").telescopeUndo,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        lazy = true,
        config = function()
            require("telescope").setup(require(CONFIG_BASE_DIR .. "telescope").config)
            require("telescope").load_extension("undo")
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("hbac")
        end,
        keys = require("mirai.keymaps").telescope,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup(require(CONFIG_BASE_DIR .. "comment"))
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup(require(CONFIG_BASE_DIR .. "nvimAutopairs"))
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup(require(CONFIG_BASE_DIR .. "treesitterContext"))
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require("flash").setup(require(CONFIG_BASE_DIR .. "flash"))
        end,
        -- stylua: ignore
        keys = require("mirai.keymaps").flash,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = require(CONFIG_BASE_DIR .. "harpoon")
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup(require(CONFIG_BASE_DIR .. "conform"))
        end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("neogen").setup(require(CONFIG_BASE_DIR .. "neogen"))
        end,
        keys = require("mirai.keymaps").neogen,
    },
    {
        "echasnovski/mini.ai",
        version = "*",
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.align",
        version = "*",
        config = function()
            require("mini.align").setup()
        end,
    },
    {
        "echasnovski/mini.bracketed",
        version = "*",
        config = function()
            require("mini.bracketed").setup()
        end,
    },
    {
        "echasnovski/mini.cursorword",
        version = "*",
        config = function()
            require("mini.cursorword").setup()
        end,
    },
    {
        "echasnovski/mini.operators",
        version = "*",
        config = function()
            require("mini.operators").setup()
        end,
    },
    {
        "echasnovski/mini.trailspace",
        version = "*",
        config = function()
            require("mini.trailspace").setup()
        end,
    },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup(require(CONFIG_BASE_DIR .. "autoSessions"))
        end,
    },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup(require(CONFIG_BASE_DIR .. "ccc"))
        end,
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup()
        end,
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })

            require("cmp").config.formatting = {
                format = require("tailwindcss-colorizer-cmp").formatter,
            }
        end,
    },
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup({})
        end,
    },
    {
        "axkirillov/hbac.nvim",
        config = true,
    },
}

return M
