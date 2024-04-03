-- Here are the LSP plugins

local CONFIG_BASE_DIR = "mirai.plugins."

local MASON_ENSURE_INSTALLED = {
    "asm-lsp",
    "asmfmt",
    "bash-debug-adapter",
    "bash-language-server",
    "black",
    "blackd-client",
    "clang-format",
    "clangd",
    "cmake-language-server",
    "cmakelang",
    "cmakelint",
    "cpplint",
    "cpptools",
    "cspell",
    "css-lsp",
    "cssmodules-language-server",
    -- "deno",
    "docker-compose-language-service",
    "dockerfile-language-server",
    -- "efm",
    "firefox-debug-adapter",
    "gh",
    "glow",
    "glsl_analyzer",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gomodifytags",
    "google-java-format",
    "gopls",
    "gotests",
    "gotestsum",
    "gradle-language-server",
    "html-lsp",
    "htmlbeautifier",
    "htmlhint",
    "htmx-lsp",
    "java-debug-adapter",
    "java-test",
    "jedi-language-server",
    "jq",
    "jq-lsp",
    "json-lsp",
    "jsonlint",
    "lua-language-server",
    "luacheck",
    "luaformatter",
    "markdownlint",
    "mdx-analyzer",
    "prettierd",
    "prisma-language-server",
    "pylint",
    "pyright",
    "python-lsp-server",
    "rstcheck",
    "rust-analyzer",
    "shellcheck",
    "sql-formatter",
    "sqlfmt",
    "sqlls",
    "sqls",
    "stylua",
    "tailwindcss-language-server",
    "tree-sitter-cli",
    "ts-standard",
    "typescript-language-server",
    "unocss-language-server",
    "vim-language-server",
    "yaml-language-server",
    "yamlfix",
    "yamlfmt",
    "yamllint",
}

local M = {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        ensure_installed = MASON_ENSURE_INSTALLED,
        config = function()
            require("mason").setup(require(CONFIG_BASE_DIR .. "mason"))
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        ensure_installed = MASON_ENSURE_INSTALLED,
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
            local lua_config = require(CONFIG_BASE_DIR .. "lspconfig").lua_ls
            local clangd_conf = require(CONFIG_BASE_DIR .. "lspconfig").clangd
            lsp.lua_ls.setup(lua_config)
            lsp.clangd.setup(clangd_conf)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            -- 'hrsh7th/cmp-path',
            "FelipeLema/cmp-async-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "L3MON4D3/cmp-luasnip-choice",
            -- 'rcarriga/cmp-dap',
            "KadoBOT/cmp-plugins",
            "chrisgrieser/cmp_yanky",
            "jc-doyle/cmp-pandoc-references",
            "David-Kunz/cmp-npm",
            "mmolhoek/cmp-scss",
            "pontusk/cmp-sass-variables",
            "amarakon/nvim-cmp-fonts",
            "nat-418/cmp-color-names.nvim",
            "jcha0713/cmp-tw2css",
            "garyhurtz/cmp_bulma.nvim",
            "hrsh7th/cmp-emoji",
            "andersevenrud/cmp-tmux",
            "tzachar/fuzzy.nvim",
            "tzachar/cmp-fuzzy-buffer",
            "tzachar/cmp-fuzzy-path",
            "lukas-reineke/cmp-rg",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "JMarkin/cmp-diag-codes",
            "hrsh7th/cmp-calc",
            "uga-rosa/cmp-dictionary",
            -- 'hrsh7th/cmp-omni',
            "ray-x/cmp-treesitter",
            "jmbuhr/otter.nvim",
            "gbprod/yanky.nvim",
        },
        lazy = true,
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            local cmp = require("cmp")

            cmp.setup(require(CONFIG_BASE_DIR .. "cmp").config)
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "async_path" },
                    { name = "cmdline" },
                    { name = "fuzzy_path", option = { fd_timeout_msec = 1500 } },
                }, {
                    { name = "async_path" },
                    { name = "cmdline" },
                    { name = "fuzzy_path", option = { fd_timeout_msec = 1500 } },
                }),
            })

            cmp.setup.cmdline("/", {
                sources = cmp.config.sources({
                    { name = "fuzzy_buffer" },
                    { name = "nvim_lsp_document_symbol" },
                    { name = "buffer" },
                }, {
                    { name = "fuzzy_buffer" },
                    { name = "nvim_lsp_document_symbol" },
                    { name = "buffer" },
                }),
            })

            -- cmp.setup.filetype(
            --    {
            --        "dap-repl",
            --        "dapui_watches",
            --        "dapui_hover"
            --    }, {
            --        sources = {
            --            { name = "dap" },
            --        },
            --    })
            cmp.setup.filetype({ "conf", "config", "ini", "css", "sass", "scss" }, { sources = { { name = "fonts" } } })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        lazy = true,
    },
    {
        "L3MON4D3/cmp-luasnip-choice",
        config = function()
            require("cmp_luasnip_choice").setup({
                auto_open = true,
            })
        end,
        lazy = true,
    },
    {
        "KadoBOT/cmp-plugins",
        lazy = true,
        config = function()
            require("cmp-plugins").setup({
                files = { ".*\\.lua" },
            })
        end,
    },
    {
        "David-Kunz/cmp-npm",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "json",
        config = function()
            require("cmp-npm").setup({})
        end,
    },
    {
        "nat-418/cmp-color-names.nvim",
        lazy = true,
        config = function()
            require("cmp-color-names").setup()
        end,
    },
    {
        "uga-rosa/cmp-dictionary",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("cmp_dictionary").setup(require(CONFIG_BASE_DIR .. "cmpDictionary"))
        end,
    },
    {
        "jmbuhr/otter.nvim",
        lazy = true,
        config = function()
            require("otter").setup(require(CONFIG_BASE_DIR .. "otter"))
        end,
    },
    {
        "gbprod/yanky.nvim",
        lazy = true,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- {
    -- 	"mfussenegger/nvim-lint",
    -- 	opts = {},
    -- },
}

return M
