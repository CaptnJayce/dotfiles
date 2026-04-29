local opt = vim.opt

-- Tabs (Casey's preference)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.showmode = false   -- lualine handles this

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Misc
opt.updatetime = 200
opt.timeoutlen = 400
opt.undofile = true
opt.swapfile = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

-- Dart/Flutter files use spaces (Dart style guide requires it)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dart" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

