local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup(require("mirai.plugins.treesitter"))
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
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim"
        },
        lazy = true,
        config = function()
            require("telescope").setup(require("mirai.plugins.telescope").config)
            require("telescope").load_extension("undo")
        end,
        keys = require("mirai.keymaps").telescope,
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        keys = require("mirai.keymaps").telescopeUndo,
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
}

return plugins
