-- general keymaps
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- move selected block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle when doing half page moves
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":BufferClose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":BufferNext<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":BufferPrevious<CR>") --  go to previous tab

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- restart lsp server (not on youtube nvim video)
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

vim.keymap.set("n", "<leader>xe", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- barbar - tabs
local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gC", ":Git commit<CR>")

-- Detect todos and toggle between ":" and ";", or show a message if not found
-- This is to "mark them as done"
vim.keymap.set("n", "<leader>td", function()
	-- Get the current line
	local current_line = vim.fn.getline(".")
	-- Get the current line number
	local line_number = vim.fn.line(".")
	if string.find(current_line, "TODO:") then
		-- Replace the first occurrence of ":" with ";"
		local new_line = current_line:gsub("TODO:", "TODO;")
		-- Set the modified line
		vim.fn.setline(line_number, new_line)
	elseif string.find(current_line, "TODO;") then
		-- Replace the first occurrence of ";" with ":"
		local new_line = current_line:gsub("TODO;", "TODO:")
		-- Set the modified line
		vim.fn.setline(line_number, new_line)
	else
		vim.cmd("echo 'todo item not detected'")
	end
end, { desc = "[P]TODO toggle item done or not" })

-- Generate/update a Markdown TOC
-- To generate the TOC I use the markdown-toc plugin
-- https://github.com/jonschlinkert/markdown-toc
-- And the markdown-toc plugin installed as a LazyExtra
vim.keymap.set("n", "<leader>mt", function()
	local path = vim.fn.expand("%") -- Expands the current file name to a full path
	local bufnr = 0 -- The current buffer number, 0 references the current active buffer
	-- Save the current view
	-- If I don't do this, my folds are lost when I run this keymap
	vim.cmd("mkview")
	-- Retrieves all lines from the current buffer
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local toc_exists = false -- Flag to check if TOC marker exists
	local frontmatter_end = 0 -- To store the end line number of frontmatter
	-- Check for frontmatter and TOC marker
	for i, line in ipairs(lines) do
		if i == 1 and line:match("^---$") then
			-- Frontmatter start detected, now find the end
			for j = i + 1, #lines do
				if lines[j]:match("^---$") then
					frontmatter_end = j -- Save the end line of the frontmatter
					break
				end
			end
		end
		-- Checks for the TOC marker
		if line:match("^%s*<!%-%-%s*toc%s*%-%->%s*$") then
			toc_exists = true -- Sets the flag if TOC marker is found
			break -- Stops the loop if TOC marker is found
		end
	end
	-- Inserts H1 heading and <!-- toc --> at the appropriate position
	if not toc_exists then
		if frontmatter_end > 0 then
			-- Insert after frontmatter
			vim.api.nvim_buf_set_lines(
				bufnr,
				frontmatter_end,
				frontmatter_end,
				false,
				{ "", "# Contents", "<!-- toc -->" }
			)
		else
			-- Insert at the top if no frontmatter
			vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "# Contents", "<!-- toc -->" })
		end
	end
	-- Silently save the file, in case TOC being created for first time (yes, you need the 2 saves)
	vim.cmd("silent write")
	-- Silently run markdown-toc to update the TOC without displaying command output
	vim.fn.system("markdown-toc -i " .. path)
	vim.cmd("edit!") -- Reloads the file to reflect the changes made by markdown-toc
	vim.cmd("silent write") -- Silently save the file
	vim.notify("TOC updated and file saved", vim.log.levels.INFO)
	-- -- In case a cleanup is needed, leaving this old code here as a reference
	-- -- I used this code before I implemented the frontmatter check
	-- -- Moves the cursor to the top of the file
	-- vim.api.nvim_win_set_cursor(bufnr, { 1, 0 })
	-- -- Deletes leading blank lines from the top of the file
	-- while true do
	--   -- Retrieves the first line of the buffer
	--   local line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
	--   -- Checks if the line is empty
	--   if line == "" then
	--     -- Deletes the line if it's empty
	--     vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
	--   else
	--     -- Breaks the loop if the line is not empty, indicating content or TOC marker
	--     break
	--   end
	-- end
	-- Restore the saved view (including folds)
	vim.cmd("loadview")
end, { desc = "[P]Insert/update Markdown TOC" })

-- Search UP for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set({ "n", "v" }, "gk", function()
	-- `?` - Start a search backwards from the current cursor position.
	-- `^` - Match the beginning of a line.
	-- `##` - Match 2 ## symbols
	-- `\\+` - Match one or more occurrences of prev element (#)
	-- `\\s` - Match exactly one whitespace character following the hashes
	-- `.*` - Match any characters (except newline) following the space
	-- `$` - Match extends to end of line
	vim.cmd("silent! ?^##\\+\\s.*$")
	-- Clear the search highlight
	vim.cmd("nohlsearch")
end, { desc = "Go to previous markdown header" })

-- Search DOWN for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set({ "n", "v" }, "gj", function()
	-- `/` - Start a search forwards from the current cursor position.
	-- `^` - Match the beginning of a line.
	-- `##` - Match 2 ## symbols
	-- `\\+` - Match one or more occurrences of prev element (#)
	-- `\\s` - Match exactly one whitespace character following the hashes
	-- `.*` - Match any characters (except newline) following the space
	-- `$` - Match extends to end of line
	vim.cmd("silent! /^##\\+\\s.*$")
	-- Clear the search highlight
	vim.cmd("nohlsearch")
end, { desc = "Go to next markdown header" })
