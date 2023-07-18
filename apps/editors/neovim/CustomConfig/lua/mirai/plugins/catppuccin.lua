local M = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return { LineNr = { fg = colors.text } }
    end,
    integrations = {
        cmp = true,
        telescope = true,
        notify = true,
        dashboard = true,
        dropbar = {
            enabled = true,
            color_mode = true,
        },
        harpoon = true,
        noice = true,
        mason = true,
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        treesitter_context = true,
        treesitter = true,
        lsp_trouble = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
}

return M
