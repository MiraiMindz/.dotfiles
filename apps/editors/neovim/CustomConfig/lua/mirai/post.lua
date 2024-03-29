-- print("#03 POST MODULE LOADED /lua/mirai/post.lua")

vim.cmd.colorscheme("catppuccin")
local autocmd = vim.api.nvim_create_autocmd


-- Auto format on save using conform
autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Auto lint files
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
