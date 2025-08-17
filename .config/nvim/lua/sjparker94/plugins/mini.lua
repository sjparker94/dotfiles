return {
	"echasnovski/mini.nvim",
	version = "*",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("mini.operators").setup({})
		require("mini.surround").setup({})
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
				end,
			},
		})
		require("mini.pairs").setup({})
	end,
}
