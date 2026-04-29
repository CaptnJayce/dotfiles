return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})
			require("nvim-treesitter").install({
				"lua",
				"python",
				"typescript",
				"tsx",
				"javascript",
				"cpp",
				"c",
				"bash",
				"json",
				"yaml",
				"toml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"sql",
				"regex",
			})
		end,
	},
}
