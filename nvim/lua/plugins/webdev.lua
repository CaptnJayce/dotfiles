return {
	-- Auto-close and rename HTML/JSX/TSX tags
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue", "xml" },
		config = function()
			require("nvim-ts-autotag").setup()
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
