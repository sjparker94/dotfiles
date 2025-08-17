return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>hn", function()
			ui.nav_next()
		end, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<leader>hp", function()
			ui.nav_prev()
		end, { desc = "Go to previous harpoon mark" })
		keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add current file to harpoon" })
		keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		keymap.set("n", "<leader>hh", function()
			ui.nav_file(1)
		end, { desc = "Go to first harpoon mark" })
		keymap.set("n", "<leader>hj", function()
			ui.nav_file(2)
		end, { desc = "Go to second harpoon mark" })
		keymap.set("n", "<leader>hk", function()
			ui.nav_file(3)
		end, { desc = "Go to third harpoon mark" })
		keymap.set("n", "<leader>hl", function()
			ui.nav_file(4)
		end, { desc = "Go to fourth harpoon mark" })
	end,
}
