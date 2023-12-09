local M = {
    autoclose = true,
    threshold = 1,
    close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
    end,
}


return M
