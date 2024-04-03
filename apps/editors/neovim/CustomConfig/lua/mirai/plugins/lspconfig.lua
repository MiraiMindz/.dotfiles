local M = {}

M.lua_ls = {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false, enabled = false }
        },
    },
}

M.clangd = {
    arguments = { "-D_cdecl=1" },
}

return M
