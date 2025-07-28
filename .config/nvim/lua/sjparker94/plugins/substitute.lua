return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		substitute.operator({
			modifiers = function(state)
				if state.vmode == "line" then
					return { "reindent" }
				end
			end,
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
		keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
		keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
		keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
	end,
}
