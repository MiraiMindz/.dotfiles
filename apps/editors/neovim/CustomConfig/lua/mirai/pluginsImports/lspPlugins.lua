local plugins = {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        ensure_installed = require("mirai.lsp").mason_ensure_installed,
        config = function()
            require("mason").setup(require("mirai.plugins.mason"))
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        ensure_installed = require("mirai.lsp").mason_ensure_installed,
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({ capabilities = lsp_capabilities })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        opts = {
            inlay_hints = { enabled = true },
        },
        config = function()
            local lsp = require("lspconfig")
            lsp.lua_ls.setup(require("mirai.plugins.lspconfig").lua_ls)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            local cmp = require("cmp")
            cmp.setup(require("mirai.plugins.cmp").config)
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
}

return plugins
