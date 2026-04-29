return {
	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({ check_ts = true })
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- File manager
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = false,
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},

	-- Better f/t motions
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
		end,
	},

	-- Diagnostics panel
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<CR>",                            desc = "Toggle Trouble" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>",     desc = "Workspace diagnostics" },
			{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>",      desc = "Document diagnostics" },
		},
		config = function()
			require("trouble").setup()
		end,
	},

	-- Floating cmdline with command suggestions
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
				},
				messages = { enabled = true },
				popupmenu = { enabled = false },  -- nvim-cmp handles completion menus
				notify = {
					enabled = true,
					view = "notify",
				},
				lsp = {
					progress = { enabled = true },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = { enabled = true, silent = true },
					signature = { enabled = true },
				},
				presets = {
					command_palette = true,       -- centres the cmdline popup
					long_message_to_split = true,
					lsp_doc_border = true,
				},
			})
		end,
	},
}
