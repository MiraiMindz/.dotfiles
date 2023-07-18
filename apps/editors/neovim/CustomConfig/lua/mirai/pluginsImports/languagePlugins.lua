local plugins = {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
    },
    {
        "leoluz/nvim-dap-go",
        ft = { "go" },
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "olexsmir/gopher.nvim",
        ft = { "go" },
        dependencies = { "mfussenegger/nvim-dap" },
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = { "python" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            require("dap-python").setup(opts)
            local path = "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = { "rust" },
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
        dependencies = { "neovim/nvim-lspconfig" },
        opts = function()
            local on_attach = require("lspconfig").on_attach
            local capabilities = require("lspconfig").capabilities
            local options = {
                server = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                },
            }
            return options
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "saecki/crates.nvim",
        dependencies = { "hrsh7th/nvim-cmp" },
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
    },
}

return plugins
