local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits
map("n", "<C-Up>",    ":resize +2<CR>",          { silent = true })
map("n", "<C-Down>",  ":resize -2<CR>",          { silent = true })
map("n", "<C-Left>",  ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Buffer nav
map("n", "<S-l>",       ":bnext<CR>",    { silent = true })
map("n", "<S-h>",       ":bprevious<CR>", { silent = true })
map("n", "<leader>bd",  ":bdelete<CR>",  { desc = "Delete buffer" })

-- File tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",    { desc = "Recent files" })

-- LSP (populated via LspAttach, but global fallbacks)
map("n", "<leader>ca", vim.lsp.buf.code_action,    { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename,         { desc = "Rename" })
map("n", "gd",         vim.lsp.buf.definition,     { desc = "Go to definition" })
map("n", "gr",         vim.lsp.buf.references,     { desc = "References" })
map("n", "K",          vim.lsp.buf.hover,          { desc = "Hover docs" })
map("n", "<leader>d",  vim.diagnostic.open_float,  { desc = "Show diagnostic" })
map("n", "[d",         vim.diagnostic.goto_prev,   { desc = "Prev diagnostic" })
map("n", "]d",         vim.diagnostic.goto_next,   { desc = "Next diagnostic" })

-- Terminal (toggleterm)
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>",      { desc = "Float terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>",   { desc = "Vertical terminal" })
-- Double-escape exits terminal mode without breaking apps that use single Esc
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Git (neogit + diffview)
map("n", "<leader>gg", "<cmd>Neogit<CR>",                   { desc = "Neogit" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>",             { desc = "Diff view" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>",    { desc = "File history" })
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>",            { desc = "Close diff view" })

-- Quick clear search highlight
map("n", "<Esc>", ":noh<CR>", { silent = true })

-- Stay in indent mode in visual
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==",       { silent = true })
map("n", "<A-k>", ":m .-2<CR>==",       { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv",  { silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv",  { silent = true })
