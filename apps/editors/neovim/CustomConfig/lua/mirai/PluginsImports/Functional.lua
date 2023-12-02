local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({})
            --local configs = require("nvim-treesitter.configs")
            --configs.setup(require("mirai.plugins.treesitter"))
        end
    },
}

return plugins
