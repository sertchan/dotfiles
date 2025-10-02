require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		bash = { "beautysh" },
		toml = { "taplo" },
		json = { "fixjson" },
		rust = { "rustfmt" },
		yaml = { "yamlfix" },
		python = { "isort", "black" },
		css = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
