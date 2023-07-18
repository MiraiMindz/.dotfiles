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
        keys = require("mirai.plugins.telescope").keys,
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        keys = require("mirai.plugins.telescopeUndo").keys,
    },
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        opts = require("mirai.plugins.harpoon").opts,
        keys = require("mirai.plugins.harpoon").keys,
        config = function(_, opts)
            require("harpoon").setup(opts)
            for pos = 1, 9 do
                vim.keymap.set("n", "<C-w>" .. pos, function()
                    require("harpoon.ui").nav_file(pos)
                end, { desc = "Move to harpoon mark #" .. pos })
            end
        end
    },
}

return plugins
