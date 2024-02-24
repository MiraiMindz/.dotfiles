local M = {}

local PRIORITY_WEIGHT_VALUE = 5

local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local sources_list = {
    { name = "luasnip",                 priority = 10, dup = 0 },
    { name = "nvim_lsp",                priority = 10, dup = 0 },
    { name = "nvim_lua",                priority = 10, dup = 0 },
    { name = "codeium",                 priority = 10, dup = 0 },
    { name = "calc",                    priority = 9,  dup = 0 },
    { name = "emoji",                   priority = 8,  dup = 0 },
    { name = "nvim_lsp_signature_help", priority = 10, dup = 0 },
    { name = "treesitter",              priority = 8,  dup = 0 },
    { name = "otter",                   priority = 8,  dup = 0 },
}

-- local sources_list = {
--     { name = "luasnip",           priority = 10,      dup = 0 },
--     { name = "nvim_lsp",          priority = 10,      dup = 0 },
--     { name = "nvim_lua",          priority = 10,      dup = 0 },
--     { name = "codeium",           priority = 10,      dup = 0 },
--     -- { name = "buffer", priority = 8, dup = 0 },
--     -- { name = "async_path", priority = 8, dup = 0 },
--     --{ name = "cmdline" },
--     { name = "luasnip_choice",    priority = 8,       dup = 0 },
--     { name = "plugins",           priority = 8,       dup = 0 },
--     { name = "cmp_yanky",         priority = 8,       dup = 0 },
--     { name = "pandoc_references", priority = 8,       dup = 0 },
--     { name = "npm",               keyword_length = 4, priority = 8, dup = 0 },
--     {
--         name = "scss",
--         option = {
--             triggers = { "$" },                          -- default value
--             extension = ".scss",                         -- default value
--             pattern = [=[\%(\s\|^\)\zs\$[[:alnum:]_\-0-9]*:\?]=], -- default value
--             folders = { "styles", "src" },
--         },
--         priority = 8,
--         dup = 0,
--     },
--     { name = "sass-variables", priority = 8, dup = 0 },
--     { name = "color_names",    priority = 8, dup = 0 },
--     { name = "cmp-tw2css",     priority = 8, dup = 0 },
--     {
--         name = "bulma",
--         option = {
--             filetypes = {
--                 "markdown",
--             },
--         },
--         priority = 8,
--         dup = 0,
--     },
--     { name = "emoji",        priority = 8, dup = 0 },
--     {
--         name = "tmux",
--         option = {
--             all_panes = false,
--             label = "[tmux]",
--             trigger_characters = { "." },
--             trigger_characters_ft = {},
--             keyword_pattern = [[\w\+]],
--             capture_history = false,
--         },
--         priority = 8,
--         dup = 0,
--     },
--     { name = "fuzzy_buffer", priority = 8, dup = 0 },
--     { name = "fuzzy_path",   priority = 8, dup = 0 },
--     {
--         name = "rg",
--         priority = 8,
--         dup = 0,
--         -- Try it when you feel cmp performance is poor
--         -- keyword_length = 3
--     },
--     { name = "nvim_lsp_signature_help", priority = 10, dup = 0 },
--     {
--         name = "diag-codes",
--         -- default completion available only in comment context
--         -- use false if you want to get in other context
--         option = { in_comment = true },
--         priority = 8,
--         dup = 0,
--     },
--     { name = "calc",                    priority = 9 },
--     {
--         name = "dictionary",
--         keyword_length = 2,
--         priority = 8,
--         dup = 0,
--     },
--     -- {
--     --    name = "omni",
--     --    option = {
--     --        disable_omnifuncs = { "v:lua.vim.lsp.omnifunc" },
--     --    },
--     -- },
--     { name = "treesitter", priority = 8, dup = 0 },
--     { name = "otter",      priority = 8, dup = 0 },
-- }

local borderStyle = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

M.config = {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                Codeium = "[Codeium]",
            },
        }),
    },
    window = {
        completion = { border = borderStyle },
        documentation = { border = borderStyle },
        mapping = cmp.mapping.preset.cmdline(),
        -- sources = cmp.config.sources(sources_list),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    },

    event = {
        on = {
            "confirm_done",
            cmp_autopairs.on_confirm_done(),
        },
    },

    --[[
        Importing CMP into the Keymaps doens't work because they are loaded \
        before the plugin itself, so the keymaps are stored here instead.
    --]]
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<Down>"] = cmp.mapping(
            cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Select,
            }),
            { "i", "c" }
        ),
        ["<Up>"] = cmp.mapping(
            cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Select,
            }),
            { "i", "c" }
        ),
    }),
    sources = cmp.config.sources(sources_list),
    sorting = {
        priority_weight = PRIORITY_WEIGHT_VALUE,
        comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.offset,
            cmp.config.compare.kind,
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find("^_+")
                local _, entry2_under = entry2.completion_item.label:find("^_+")
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                    return false
                elseif entry1_under < entry2_under then
                    return true
                end
            end,

            cmp.config.compare.score,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    enabled = function()
        local context = require("cmp.config.context")
        local buffer_type = vim.api.nvim_get_option_value("buftype", { scope = "local" })
        local is_not_prompt = buffer_type ~= "prompt"
        local is_in_command_mode = vim.api.nvim_get_mode().mode == "c"
        local not_in_treesitter_comment = not context.in_treesitter_capture("comment")
        local not_in_syntax_comment = not context.in_syntax_group("Comment")

        return (is_not_prompt and is_in_command_mode)
            or (is_not_prompt and not_in_treesitter_comment and not_in_syntax_comment)
    end,
}

return M
