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
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        keys = require("mirai.plugins.telescope").keys,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
        config = function()
            require("harpoon").setup(opts)
        end,
        opts = {
            keys = {
                {"n", "<C-a>", require("harpoon.mark").add_file, desc = "Add the current file to the Harpoon list"},
                {"n", "<C-e>", require("harpoon.ui").toggle_quick_menu, desc = "Toggles the Harpoon menu"},
                {"n", "\\+z", function() require("harpoon.ui").nav_file(1) end, desc = ""},
            },
        },
    },
}
return plugins
