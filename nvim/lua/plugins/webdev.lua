return {
	-- Auto-close and rename HTML/JSX/TSX tags
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Format on save
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript      = { "prettier" },
					javascriptreact = { "prettier" },
					typescript      = { "prettier" },
					typescriptreact = { "prettier" },
					html            = { "prettier" },
					css             = { "prettier" },
					json            = { "prettier" },
					yaml            = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Inline colour swatches for hex/rgb/hsl/Tailwind values
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = false,
					css = true,
					tailwind = "lsp",
				},
			})
		end,
	},
}
