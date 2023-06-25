local autocmd = vim.api.nvim_create_autocmd
vim.opt.colorcolumn = "80"

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
