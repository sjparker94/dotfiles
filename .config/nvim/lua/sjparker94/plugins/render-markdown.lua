-- local color1_bg = "#f38ba8"
-- local color2_bg = "#a6e3a1"
-- local color3_bg = "#89b4fa"
-- local color4_bg = "#cba6f7"
-- local color5_bg = "#f9e2af"
-- local color6_bg = "#fab387"

local color_fg = "#1e1e2e"

print(vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg)))

return {}
-- return {
-- 	"MeanderingProgrammer/render-markdown.nvim",
-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
-- 	opts = {
-- 		heading = {
--
-- 			sign = true,
--
-- 			position = "inline",
--
-- 			-- to change the colors of the headins. they are respecting the colour scheme so didnt seem a need
--
-- 			-- vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg)),
-- 			-- vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg)),
-- 			-- vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg)),
-- 			-- vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg)),
-- 			-- vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg)),
-- 			-- vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg)),
--
-- 			-- backgrounds = {
-- 			-- 	"Headline1Bg",
-- 			-- 	"Headline2Bg",
-- 			-- 	"Headline3Bg",
-- 			-- 	"Headline4Bg",
-- 			-- 	"Headline5Bg",
-- 			-- 	"Headline6Bg",
-- 			-- },
-- 			-- foregrounds = {
-- 			-- 	"Headline1Fg",
-- 			-- 	"Headline2Fg",
-- 			-- 	"Headline3Fg",
-- 			-- 	"Headline4Fg",
-- 			-- 	"Headline5Fg",
-- 			-- 	"Headline6Fg",
-- 			-- },
-- 		},
-- 	},
-- }
