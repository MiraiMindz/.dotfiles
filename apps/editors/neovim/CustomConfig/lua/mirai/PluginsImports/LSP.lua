print("LOADED MIRAI/PLUGINS LSP.lua")
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
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
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
            'L3MON4D3/cmp-luasnip-choice',
            'rcarriga/cmp-dap',
            'hrsh7th/cmp-nvim-lua',
            'KadoBOT/cmp-plugins',
            'chrisgrieser/cmp_yanky',
            'jc-doyle/cmp-pandoc-references',
            'David-Kunz/cmp-npm',
            'amarakon/nvim-cmp-fonts',
            'nat-418/cmp-color-names.nvim',
            'jcha0713/cmp-tw2css',
            'garyhurtz/cmp_bulma.nvim',
            'hrsh7th/cmp-emoji',
            'andersevenrud/cmp-tmux',
            'lukas-reineke/cmp-rg',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'JMarkin/cmp-diag-codes',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-omni',
            'ray-x/cmp-treesitter',
            'onsails/lspkind.nvim',
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            local cmp = require("cmp")
            cmp.setup(require("mirai.plugins.cmp").config) -- !IMPORTANT ERROR
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
