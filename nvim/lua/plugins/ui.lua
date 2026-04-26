return {
	-- Colourscheme — miko lives in colors/miko.lua
	{
		name = "miko",
		dir = vim.fn.stdpath("config"),
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("miko")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local miko = {
				normal   = { a = { fg = "#0f0f1a", bg = "#ffb7c5", gui = "bold" }, b = { fg = "#e8e8e8", bg = "#2d2d44" }, c = { fg = "#9090a8", bg = "#151524" } },
				insert   = { a = { fg = "#0f0f1a", bg = "#57c47f", gui = "bold" }, b = { fg = "#e8e8e8", bg = "#2d2d44" }, c = { fg = "#9090a8", bg = "#151524" } },
				visual   = { a = { fg = "#0f0f1a", bg = "#9966cc", gui = "bold" }, b = { fg = "#e8e8e8", bg = "#2d2d44" }, c = { fg = "#9090a8", bg = "#151524" } },
				replace  = { a = { fg = "#0f0f1a", bg = "#dc143c", gui = "bold" }, b = { fg = "#e8e8e8", bg = "#2d2d44" }, c = { fg = "#9090a8", bg = "#151524" } },
				command  = { a = { fg = "#0f0f1a", bg = "#e05780", gui = "bold" }, b = { fg = "#e8e8e8", bg = "#2d2d44" }, c = { fg = "#9090a8", bg = "#151524" } },
				inactive = { a = { fg = "#9090a8", bg = "#151524" },               b = { fg = "#9090a8", bg = "#151524" }, c = { fg = "#5c5c7c", bg = "#0a0a12" } },
			}
			require("lualine").setup({
				options = {
					theme = miko,
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 35 },
				renderer = { group_empty = true },
				filters = { dotfiles = false },
			})
		end,
	},

	-- Buffer tabs
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{ filetype = "NvimTree", text = "Files", padding = 1 },
					},
				},
			})
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({ scope = { enabled = true } })
		end,
	},

	-- Git signs in gutter
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add          = { text = "│" },
					change       = { text = "│" },
					delete       = { text = "󰍵" },
					topdelete    = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- Keymap hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({ delay = 500 })
		end,
	},
}
