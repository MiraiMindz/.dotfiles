-- Here are the language-specific plugins

local M = {
    --#region Go Plugins
    {
        "ray-x/go.nvim",
        lazy = true,
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod", "gowork" },
        build = ':lua require("go.install").update_all_sync()',
    },
    {
        "olexsmir/gopher.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "go", "gomod", "gowork" },
        config = function()
            require("gopher").setup()
        end,
    },
    --#endregion
    --#region Rust Plugins
    {
        "rust-lang/rust.vim",
        lazy = true,
        ft = { "rust" },
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        lazy = true,
        version = "^4", -- Recommended
        ft = { "rust" },
    },
    {
        "saecki/crates.nvim",
        lazy = true,
        dependencies = { "hrsh7th/nvim-cmp" },
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
    },
    --#endregion
    --#region Java Plugins
    {
        'niT-Tin/springboot-start.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('springboot-start').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    },
    {
        'nvim-java/nvim-java',
        dependencies = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    },
                },
            }
        },
    },
    --#endregion

}

return M
