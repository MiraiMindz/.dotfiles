local plugins = {
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
        config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
                ensure_installed = { "lua", "vim", "vimdoc"},
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
    {   -- This plugin was set here because it 
        -- breaks when I put it in another file.
        "ThePrimeagen/harpoon",
        lazy = true,
        opts = {
            tabline = true,
        },
        keys = {
            {'n', '<leader>f', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Toggle harpoon menu" },
            {'n', '<leader>a', '<cmd>lua require("harpoon.mark").toggle_file()<cr>',    desc = "Add file to harpoon list" },
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
        }
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
}

return plugins

