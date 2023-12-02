local plugins = {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        --ensure_installed = require("mirai.lsp").mason_ensure_installed,
        config = function()
            require("mason").setup()
        --    require("mason").setup(require("mirai.plugins.mason"))
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        -- ensure_installed = require("mirai.lsp").mason_ensure_installed,
        --config = function()
        --    local lspconfig = require("lspconfig")
        --    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        --    require("mason-lspconfig").setup_handlers({
        --        function(server_name)
        --            lspconfig[server_name].setup({ capabilities = lsp_capabilities })
        --        end,
        --    })
        --end,
    },
}

return plugins
