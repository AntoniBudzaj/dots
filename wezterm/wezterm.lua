local wezterm = require("wezterm")
local config = {}
config.font = wezterm.font("Hack nerd font")

config.color_scheme = "Catppuccin Frappe"

config.window_background_opacity = 0.8

config.enable_wayland = true

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
