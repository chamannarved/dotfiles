-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- Set PowerShell as default shell
config.default_prog = { "/usr/local/bin/fish", "-l" }

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 0,
}
config.window_decorations = "RESIZE"

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("JetBrains Mono")

-- and finally, return the configuration to wezterm
return config
