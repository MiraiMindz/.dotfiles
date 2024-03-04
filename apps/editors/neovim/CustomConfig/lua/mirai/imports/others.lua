-- Here are the others/random plugins

local M = {
    {
        "andweeb/presence.nvim",
        lazy = false,
    },
    -- {
    -- 	"dstein64/vim-startuptime",
    -- 	opts = {},
    -- },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        -- ft = "markdown",
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/usr/Documents/Obsidian/Vaults/Notes/**/*.md",
            "BufReadPre " .. vim.fn.expand("~") .. "/usr/Documents/Obsidian/Vaults/Notes/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/usr/Documents/Obsidian/Vaults/Notes/**/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/usr/Documents/Obsidian/Vaults/Notes/*.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            workspaces = {
                {
                    name = "Notes",
                    path = "~/usr/Documents/Obsidian/Vaults/Notes"
                },
            },
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,
                -- Trigger completion at 2 chars.
                min_chars = 2,
            },
            preferred_link_style = "wiki",
            disable_frontmatter = false,
            follow_url_func = function(url)
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,
            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                mappings = {
                    -- Create a new note from your query.
                    new = "<C-x>",
                    -- Insert a link to the selected note.
                    insert_link = "<C-l>",
                },
            },

            sort_by = "modified",
            sort_reversed = true,
            open_notes_in = "current",
            ui = {
                enable = true,         -- set to false to disable all additional syntax features
                update_debounce = 200, -- update delay after a text change (in milliseconds)
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                -- Use bullet marks for non-checkbox lists.
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            },
        },
    },
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end,
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require("silicon").setup({
                -- Configuration here, or leave empty to use defaults
                font = "FixedsysExcelsior Nerd Font=24;CartographF Nerd Font=24"
            })
        end
    },
}

return M
