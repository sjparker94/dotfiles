-- return {
-- 	"williamboman/mason.nvim",
-- 	dependencies = {
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 	},
-- 	config = function()
-- 		-- import mason
-- 		local mason = require("mason")
--
-- 		-- import mason-lspconfig
-- 		local mason_lspconfig = require("mason-lspconfig")
--
-- 		local mason_tool_installer = require("mason-tool-installer")
--
-- 		-- enable mason and configure icons
-- 		mason.setup({
-- 			ui = {
-- 				icons = {
-- 					package_installed = "✓",
-- 					package_pending = "➜",
-- 					package_uninstalled = "✗",
-- 				},
-- 			},
-- 		})
--
-- 		mason_lspconfig.setup({
-- 			-- list of servers for mason to install
-- 			ensure_installed = {
-- 				"ts_ls",
-- 				"html",
-- 				"cssls",
-- 				"tailwindcss",
-- 				"svelte",
-- 				"lua_ls",
-- 				"graphql",
-- 				"emmet_ls",
-- 				"prismals",
-- 				"gopls",
-- 				"pyright",
-- 				"eslint",
-- 				-- "deno",
-- 			},
-- 			-- auto-install configured servers (with lspconfig)
-- 			automatic_installation = true, -- not the same as ensure_installed
-- 		})
-- vim.list_extend(opts.ensure_installed, { "markdownlint-cli2", "marksman", "markdown-toc" })
--
-- 		mason_tool_installer.setup({
-- 			ensure_installed = {
-- 				"prettier", -- prettier formatter
-- 				"stylua", -- lua formatter
-- 				"eslint_d", -- js linter
-- 				"markdown-toc", -- creates markdown table of contents
-- 				"isort", -- python formatter
-- 				"black", -- python formatter
-- 				"pylint",
-- 			},
-- 		})
-- 	end,
-- }

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		lazy = false, -- Load immediately to ensure PATH is set
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				-- LSP servers (matching your vim.lsp.enable() config)
				"lua-language-server", -- Lua LSP
				"gopls", -- Go LSP
				"zls", -- Zig LSP
				"typescript-language-server", -- TypeScript LSP
				"rust-analyzer", -- Rust LSP
				"intelephense", -- PHP LSP
				"tailwindcss-language-server", -- Tailwind CSS LSP
				"html-lsp", -- HTML LSP
				"css-lsp", -- CSS LSP
				"vue-language-server", -- Vue LSP
				"svelte", -- Svelte LSP
				"pyright", -- Python LSP
				"prismals", -- Prisma LSP

				-- Formatters (for conform.nvim and general use)
				"stylua",
				"goimports",
				-- Note: gofmt comes with Go installation, not managed by Mason
				"prettier",
				"black",
				"isort",
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",

				-- Linters and diagnostics
				"golangci-lint",
				"eslint_d",
				"luacheck", -- Lua linting
				-- "pint", -- Laravel Pint for PHP (formatting & linting)

				-- Additional useful tools
				"delve", -- Go debugger
				"shfmt", -- Shell formatter
				"shellcheck", -- Shell linter

				-- Optional but useful additions
				"markdownlint", -- Markdown linting
				"yamllint", -- YAML linting
				"jsonlint", -- JSON linting
				"markdown-toc", -- creates markdown table of contents
			},
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			-- PATH is handled by core.mason-path for consistency
			require("mason").setup(opts)

			local mason_tool_installer = require("mason-tool-installer")

			-- Auto-install ensure_installed tools with better error handling
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					if mr.has_package(tool) then
						local p = mr.get_package(tool)
						if not p:is_installed() then
							vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
							p:install():once("closed", function()
								if p:is_installed() then
									vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
								else
									vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
								end
							end)
						end
					else
						vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
					end
				end
			end

			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end

			-- Setup mason-tool-installer
			-- This is useful for installing tools that are not LSP servers
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d", -- js linter
					"markdown-toc", -- creates markdown table of contents
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
				},
			})
		end,
	},
}
