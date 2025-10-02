vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "config" },
	command = "set filetype=json",
})

vim.o.undofile = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.cmd([[set clipboard+=unnamedplus]])
