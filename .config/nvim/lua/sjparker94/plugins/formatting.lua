return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		local prettier_settings = { "prettierd", "prettier", stop_after_first = true }

		conform.setup({
			formatters_by_ft = {
				go = { "goimports", "gofumpt", "goimports-reviser" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				javascript = prettier_settings,
				typescript = prettier_settings,
				javascriptreact = prettier_settings,
				typescriptreact = prettier_settings,
				svelte = prettier_settings,
				vue = prettier_settings,
				css = prettier_settings,
				scss = prettier_settings,
				less = prettier_settings,
				html = prettier_settings,
				json = prettier_settings,
				jsonc = prettier_settings,
				yaml = prettier_settings,
				markdown = prettier_settings,
				["markdown.mdx"] = prettier_settings,
				handlebars = prettier_settings,
				graphql = prettier_settings,
				lua = { "stylua" },
				python = { "isort", "black" },
				sql = { "sql-formatter" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
