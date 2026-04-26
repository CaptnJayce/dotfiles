return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"python",
					"typescript",
					"tsx",
					"javascript",
					"cpp",
					"c",
					"bash",
					"json",
					"jsonc",
					"yaml",
					"toml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"sql",
					"regex",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
