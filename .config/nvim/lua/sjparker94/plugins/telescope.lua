return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				undo = {},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")
		telescope.load_extension("live_grep_args")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")

		-- telescope find commands
		-- keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" }) -- find files within current working directory, respects .gitignore
		-- keymap.set("n", "<leader>fd", function()
		-- 	builtin.find_files({ hidden = true, no_ignore = true })
		-- end, { desc = "Fuzzy find files including hidden files e.g. .env/node_modules" }) -- find files within current working directory, including hidden files
		-- keymap.set("n", "<leader>gc", ":Telescope <CR>")
		-- keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" }) -- findstring in the current working directory as you type
		-- keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" }) -- find string under cursor in current working directory
		-- keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers in current neovim instance" }) -- list open buffers in current neovim instance
		-- keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "List available help tags" }) -- list available help tags
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>fg",
		-- 	telescope.extensions.live_grep_args.live_grep_args,
		-- 	{ noremap = true, desc = "Find string in cwd with args" }
		-- )
		-- keymap.set(
		-- 	"v",
		-- 	"<leader>fv",
		-- 	"y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
		-- 	{ desc = "search for text highlighted in visual mode" }
		-- ) -- search for text highlighted in visual mode
		--
		keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope undo" }) -- list available help tags
		local opts = { noremap = true, silent = true }
		--
		-- opts.desc = "Show LSP references"
		-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
		-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
		-- opts.desc = "Go to declaration"
		-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
		-- --
		-- opts.desc = "Show LSP definitions"
		-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
		-- --
		-- opts.desc = "Show LSP implementations"
		-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
		-- --
		-- opts.desc = "Show LSP type definitions"
		-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
		--
		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
		--
		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
		--
		-- opts.desc = "Show buffer diagnostics"
		-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
		--
		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
		--
		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer
		--
		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		--
		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end,
}
