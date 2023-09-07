vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "config" },
  command = "set filetype=json",
})

vim.cmd[[set clipboard+=unnamedplus]]
vim.cmd[[set number]]
