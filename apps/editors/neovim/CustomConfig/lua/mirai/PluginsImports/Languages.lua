local plugins = {
    {
        "olexsmir/gopher.nvim",
        ft = { "go" },
        dependencies = { "mfussenegger/nvim-dap" },
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
}

return plugins
