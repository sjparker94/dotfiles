return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
						close = "<ESC>",
					},
					layout = {
						position = "bottom", -- | top | left | right | horizontal | vertical
						ratio = 0.4,
					},

				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-j>",
						prev = "<M-k>",
						dismiss = "<M-h>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				-- copilot_node_command = "node", -- Node.js version must be > 18.x
				-- server_opts_overrides = {},
			})
		end,
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken",
			opts = {
				-- See Configuration section for options
			},
			config = function(_, opts)
				require("CopilotChat").setup(opts)

				vim.keymap.set("n", "<leader>coc", function()
					require("CopilotChat").toggle()
				end, { desc = "CopilotChat - Chat" })

				-- vim.keymap.set(
				-- 	"v",
				-- 	"<leader>coe",
				-- 	":CopilotChatExplain<CR>",
				-- 	{ desc = "CopilotChat - explain highlighted code" }
				-- )
				vim.keymap.set({ "n", "v" }, "<leader>coe", function()
					-- Use the visual selection if available, otherwise use the current buffer
					local mode = vim.api.nvim_get_mode().mode
					print("Current mode: " .. mode)

					local selection = require("CopilotChat.select").buffer
					if string.lower(mode) == "v" then
						selection = require("CopilotChat.select").visual
					end

					--
					require("CopilotChat").ask("Explain this code", {
						selection = selection,
					})
				end, { desc = "CopilotChat - explain current code" })

				vim.keymap.set("n", "<leader>coq", function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, {
							selection = require("CopilotChat.select").buffer,
						})
					end
				end, { desc = "CopilotChat - Quick chat" })
			end,
		},
	},
}
