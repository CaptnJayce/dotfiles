return {
	-- Mason: LSP/linter/formatter installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({ ui = { border = "rounded" } })

			-- Auto-install formatters/linters that mason-lspconfig doesn't cover
			local tools = { "ruff", "prettier", "clang-format", "stylua" }
			local mr = require("mason-registry")
			mr.refresh(function()
				for _, name in ipairs(tools) do
					local ok, pkg = pcall(mr.get_package, name)
					if ok and not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
	},

	-- Bridge mason ↔ lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",   -- Python type checking
					"ts_ls",     -- TypeScript / JavaScript / React
					"eslint",    -- JS/TS linting
					"clangd",    -- C / C++
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP config (nvim 0.11+ native API)
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end
					map("gd",         vim.lsp.buf.definition,                            "Go to definition")
					map("gD",         vim.lsp.buf.declaration,                           "Go to declaration")
					map("gr",         vim.lsp.buf.references,                            "References")
					map("gi",         vim.lsp.buf.implementation,                        "Go to implementation")
					map("K",          vim.lsp.buf.hover,                                 "Hover docs")
					map("<leader>ca", vim.lsp.buf.code_action,                           "Code action")
					map("<leader>rn", vim.lsp.buf.rename,                                "Rename")
					map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end, "Format")
				end,
			})

			-- Python — pyright for types, ruff as LSP for linting
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
			vim.lsp.enable("pyright")

			-- TypeScript / JavaScript / React
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = {
					"javascript", "javascriptreact", "javascript.jsx",
					"typescript", "typescriptreact", "typescript.tsx",
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literals",
							includeInlayReturnTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "literals",
						},
					},
				},
			})
			vim.lsp.enable("ts_ls")

			-- ESLint — auto-fix on save
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			vim.lsp.enable("eslint")

			-- C / C++
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
				},
			})
			vim.lsp.enable("clangd")
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python             = { "ruff_format", "ruff_organize_imports" },
					javascript         = { "prettier" },
					javascriptreact    = { "prettier" },
					typescript         = { "prettier" },
					typescriptreact    = { "prettier" },
					css                = { "prettier" },
					html               = { "prettier" },
					json               = { "prettier" },
					yaml               = { "prettier" },
					c                  = { "clang-format" },
					cpp                = { "clang-format" },
					lua                = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 800,
				},
			})
		end,
	},
}
