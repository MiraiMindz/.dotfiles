local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-tree-docs",
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup(require("mirai.plugins.treesitter"))
        end
    },
}

return plugins
