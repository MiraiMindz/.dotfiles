local plugins = {
    {
        'mrjones2014/legendary.nvim',
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
        config = function()
            require("legendary").setup(require("mirai.plugins.legendary"))
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-tree-docs",
            "nvim-treesitter/nvim-treesitter-context",
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup(require("mirai.plugins.treesitter").base)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("nvim-treesitter-context").setup(require("mirai.plugins.treesitter").context)
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            "ahmedkhalf/project.nvim"
        },
        lazy = true,
        config = function()
            require("telescope").setup(require("mirai.plugins.telescope").config)
            require("telescope").load_extension("undo")
            require('telescope').load_extension('projects')
        end,
        keys = require("mirai.keymaps").telescope,
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        keys = require("mirai.keymaps").telescopeUndo,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup(require("mirai.plugins.comment"))
        end,
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup(require("mirai.plugins.autopairs"));
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = require("mirai.plugins.whichKey")
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = require("mirai.keymaps").flash,
    },
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        opts = require("mirai.plugins.harpoon").opts,
        keys = function()
            local keys = require("mirai.keymaps")
            return keys.harpoon
        end,
        config = function(_, opts)
            require("harpoon").setup(opts)
            require("mirai.keymaps").getHarpoonJumps()
        end
    },
    {
        'stevearc/conform.nvim',
        opts = require("mirai.plugins.conform"),
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = require("mirai.keymaps").conform,
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup()
        end
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        version = "*"
    },
    {
        'echasnovski/mini.ai',
        version = false,
        config = function()
            require('mini.ai').setup()
        end
    },
    {
        'echasnovski/mini.align',
        version = false,
        config = function()
            require('mini.align').setup()
        end
    },
    {
        'echasnovski/mini.bracketed',
        version = false,
        config = function()
            require('mini.bracketed').setup()
        end
    },
    {
        'echasnovski/mini.operators',
        version = false,
        config = function()
            require('mini.operators').setup()
        end
    },
    {
        'echasnovski/mini.trailspace',
        version = false,
        config = function()
            require('mini.trailspace').setup()
        end
    },
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup(require("mirai.plugins.autoSession"))
        end
    },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup()
        end
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = function()
            require('glow').setup(require("mirai.plugins.glow"))
        end,
        cmd = "Glow"
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup(require("mirai.plugins.tailwind"))
        end
    },
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup({})
        end
    },
    {
        'axkirillov/hbac.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("hbac").setup(require("mirai.plugins.hbac"))
        end
    },
}

return plugins
