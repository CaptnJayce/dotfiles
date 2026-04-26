return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then return 15
					elseif term.direction == "vertical" then return math.floor(vim.o.columns * 0.4)
					end
				end,
				open_mapping = [[<C-\>]],
				direction = "float",
				float_opts = { border = "rounded" },
				shell = vim.o.shell,
				persist_size = true,
				persist_mode = true,
			})
		end,
	},
}
