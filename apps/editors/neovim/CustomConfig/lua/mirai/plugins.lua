local plugins = {
    {
        "andweeb/presence.nvim",
        lazy = false,
    },
    --{
    --    "alexghergh/nvim-tmux-navigation",
    --    event = "VeryLazy",
    --    config = function()
    --        require("nvim-tmux-navigation").setup({
    --            keybindings = { left = "<C-Left>", down = "<C-Down>", up = "<C-Up>", right = "<C-Right>", last_active = "<C-;>", next = "<C-Space>" }
    --        })
    --    end,
    --},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = require("mirai.plugins.catppuccin")
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = require("mirai.lsp").ts_ensure_installed,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim"
        },
        lazy = true,
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = require("mirai.plugins.telescope").undo.config,
                }
            })
            require("telescope").load_extension("undo")
        end,
        keys = require("mirai.plugins.telescope").keys,
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        keys = require("mirai.plugins.telescope").undo.keys,
    },
    { -- This plugin was set here because it
        -- breaks when I put it in another file.
        "ThePrimeagen/harpoon",
        lazy = true,
        opts = {
            tabline = true,
        },
        keys = {
            { 'n', '<leader>f', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Toggle harpoon menu" },
            { 'n', '<leader>a', '<cmd>lua require("harpoon.mark").toggle_file()<cr>',     desc =
            "Add file to harpoon list" },
        },
        config = function(_, opts)
            require("harpoon").setup(opts)
            for pos = 1, 9 do
                vim.keymap.set("n", "<C-w>" .. pos, function()
                    require("harpoon.ui").nav_file(pos)
                end, { desc = "Move to harpoon mark #" .. pos })
            end
        end
    },
    -- Setup LSP and completions
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
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
            local lspkind = require("lspkind")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        })
                    }),
                },
                window = {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "path" },
                    }, {
                        { name = "cmdline" },
                    }),
                },
                mappings = {
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            fallback()
                        end
                    end, { 'i', 'c' }),
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Select
                    }), { 'i', 'c' }),
                    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Select
                    }), { 'i', 'c' }),
                    --["<C-Down>"] = cmp.mapping.scroll_docs(-4),
                    --["<C-Up>"] = cmp.mapping.scroll_docs(4),
                    --["<Tab>"] = cmp.mapping.complete(),
                    --["<C-e>"] = cmp.mapping.abort(),
                    --["<CR>"] = cmp.mapping.confirm({ select = true }),
                    --['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 'c'}),
                    --['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 'c'}),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = "orgmode" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
                enabled = function()
                    -- disable completion in comments
                    local context = require 'cmp.config.context'
                    -- keep command mode completion enabled when cursor is in a comment
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                    else
                        return not context.in_treesitter_capture("comment")
                            and not context.in_syntax_group("Comment")
                    end
                end
            })

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
