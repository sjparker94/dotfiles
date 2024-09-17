return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
    -- stylua: ignore
    keys = {
      { "t]", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "t[", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>tT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>tl", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>tL", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
}
