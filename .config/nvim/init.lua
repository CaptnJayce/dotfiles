vim.g.mapleader = "<Space>"

-- vim.opt.termguicolors = false

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set nu")
vim.cmd("set rnu")

-- for the love of fuck remember to install xsel
vim.opt.clipboard = "unnamedplus"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
        lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {

        {
            'eddyekofo94/gruvbox-flat.nvim',
            priority = 1000,
            enabled = true,
            config = function()
                vim.cmd([[colorscheme gruvbox-flat]])
            end,
        },
        {
            "rose-pine/neovim", name = "rose-pine"
        },
        {
            'stevearc/conform.nvim',
            event = { "BufReadPre", "BufNewFile" },
            config = function()
                local conform = require("conform")

                conform.setup({
                    formatters_by_ft = {
                        lua = { "stylua" },
                        cpp = { "astyle" },
                        sh = { "beautysh" },
                    },
                })

                require("conform").setup({
                    format_on_save = {
                        -- These options will be passed to conform.format()
                        timeout_ms = 500,
                        lsp_format =
                        "fallback",
                    },
                })
            end
        },

        {
            "hrsh7th/cmp-nvim-lsp"
        },

        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            },
        },

        {
            "hrsh7th/nvim-cmp",
            config = function()
                local cmp = require("cmp")
                require("luasnip.loaders.from_vscode")
                    .lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(
                            args)
                            require(
                                "luasnip")
                                .lsp_expand(
                                    args.body)
                        end,
                    },
                    window = {
                        completion =
                            cmp.config
                            .window
                            .bordered(),
                        documentation =
                            cmp.config
                            .window
                            .bordered(),
                    },
                    mapping = cmp
                        .mapping.preset
                        .insert({
                            ["<C-b>"] =
                                cmp.mapping
                                .scroll_docs(-4),
                            ["<C-f>"] =
                                cmp.mapping
                                .scroll_docs(4),
                            ["<C-Space>"] =
                                cmp.mapping
                                .complete(),
                            ["<C-e>"] =
                                cmp.mapping
                                .abort(),
                            ["<CR>"] =
                                cmp.mapping
                                .confirm({ select = true }),
                        }),
                    sources = cmp.config
                        .sources({
                            { name = "nvim_lsp" },
                            { name = "luasnip" }, -- For luasnip users.
                        }, {
                            { name = "buffer" },
                        }),
                })
            end,
        },

        {
            'xiyaowong/transparent.nvim',
        },

        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        },

        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },

        {
            "williamboman/mason.nvim",
            lazy = false,
            config = function()
                require("mason").setup()
            end,
        },

        {
            "williamboman/mason-lspconfig.nvim",
            lazy = false,
            opts = {
                auto_install = true,
            },
        },

        {
            "neovim/nvim-lspconfig",
            lazy = false,
            config = function()
                local capabilities = require(
                        'cmp_nvim_lsp')
                    .default_capabilities()

                local lspconfig = require("lspconfig")
                lspconfig.tsserver.setup({
                    capabilities = capabilities
                })
                lspconfig.bashls.setup({
                    capabilities = capabilities
                })
                lspconfig.clangd.setup({
                    capabilities = capabilities
                })
                lspconfig.html.setup({
                    capabilities = capabilities
                })
                lspconfig.lua_ls.setup({
                    capabilities = capabilities
                })
                lspconfig.omnisharp.setup({
                    capabilities = capabilities
                })
            end,
        },

        {
            'andweeb/presence.nvim'
        },

        {
            "iamcco/markdown-preview.nvim",
            config = function()
                vim.fn["mkdp#util#install"]()
            end,
        },
    },

    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>t', '<Cmd>Neotree toggle<CR>')

vim.cmd.colorscheme "rose-pine"
