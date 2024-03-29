local M = {
    lsp = {
        hover = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
    buffers = {
        -- if set to true, the filetype of the otterbuffers will be set.
        -- otherwise only the autocommand of lspconfig that attaches
        -- the language server will be executed without setting the filetype
        set_filetype = false,
        -- write <path>.otter.<embedded language extension> files
        -- to disk on save of main buffer.
        -- useful for some linters that require actual files
        -- otter files are deleted on quit or main buffer close
        write_to_disk = false,
    },
    strip_wrapping_quote_characters = { "'", '"', "`" },
}


return M
