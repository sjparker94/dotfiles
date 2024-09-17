-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font_with_fallback({
	{

		family = "JetBrains Mono",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	"MesloLGS Nerd Font Mono",
})

config.font_size = 19

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
