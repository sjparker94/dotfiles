return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- javascript = { "deno", "eslint_d" },
			-- typescript = { "deno", "eslint_d" },
			-- javascriptreact = { "deno", "eslint_d" },
			-- typescriptreact = { "deno", "eslint_d" },
			-- svelte = { "eslint_d" },
			python = { "pylint" },
		}

		-- local eslint_d = require("lint").linters.eslint_d

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
		vim.keymap.set("n", "<leader>gl", function()
			local linters = lint.get_running()
			print("hello world")
			print(table.concat(linters, ", "))
			return "󱉶 " .. table.concat(linters, ", ")
		end, { desc = "Get current running linter" })
	end,
}
