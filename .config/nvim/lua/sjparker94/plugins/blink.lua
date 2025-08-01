return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip", -- snippet engine
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		-- event = "InsertEnter",
		version = "*",
		config = function()
			-- vim.cmd('highlight Pmenu guibg=none')
			-- vim.cmd('highlight PmenuExtra guibg=none')
			-- vim.cmd('highlight FloatBorder guibg=none')
			-- vim.cmd('highlight NormalFloat guibg=none')

			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "normal",
				},
				sources = {
					-- per_filetype = {
					--     codecompanion = { "codecompanion" },
					-- },
					default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
						cmdline = {
							min_keyword_length = 2,
						},
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
				keymap = {
					["<C-f>"] = {},
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },

					-- ["<C-b>"] = { "scroll_docs", -4 },
					-- ["<C-f>"] = { "scroll_docs", 4 },
					["<C-Space>"] = { "show", "fallback" },
					-- ["<C-e>"] = { "close", "fallback" },
					["<CR>"] = { "accept", "fallback" },

					-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
					-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
					--
					-- 				["<Tab>"] = cmp.mapping(function(fallback)
					-- 					-- if cmp.visible() then
					-- 					-- 	cmp.select_next_item()
					-- 					if luasnip.expand_or_jumpable() then
					-- 						luasnip.expand_or_jump()
					-- 					else
					-- 						fallback()
					-- 					end
					-- 				end, { "i", "s" }),
					--
					-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
					-- 					-- if cmp.visible() then
					-- 					-- 	cmp.select_prev_item()
					-- 					if luasnip.jumpable(-1) then
					-- 						luasnip.jump(-1)
					-- 					else
					-- 						fallback()
					-- 					end
					-- 				end, { "i", "s" }),
				},
				cmdline = {
					enabled = false,
					completion = { menu = { auto_show = true } },
					keymap = {
						["<CR>"] = { "accept_and_enter", "fallback" },
					},
				},
				completion = {
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
