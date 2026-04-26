return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					layout_config = { horizontal = { preview_width = 0.55 } },
					file_ignore_patterns = { ".git/", "node_modules/", ".dart_tool/" },
				},
			})
			telescope.load_extension("fzf")
		end,
	},
}
