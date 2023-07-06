local autocmd = vim.api.nvim_create_autocmd
vim.opt.colorcolumn = "80"

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- vim.cmd.colorscheme "catppuccin"
