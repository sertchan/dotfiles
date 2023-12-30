local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("andweeb/presence.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"williamboman/mason.nvim",
	})
	use("mfussenegger/nvim-lint")
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("rebelot/kanagawa.nvim")
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({ "luckasRanarison/tree-sitter-hypr" })
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use({
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
	})
	-- Sync Things
	if packer_bootstrap then
		require("packer").sync()
	end
end)
