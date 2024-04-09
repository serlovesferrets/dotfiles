local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local theme = "catppuccin-mocha"

config.color_scheme = theme
config.window_decorations = "RESIZE"

config.colors = {
	tab_bar = {
		background = "#181826",
		inactive_tab_hover = {
			italic = true,
			bg_color = "#181826",
			fg_color = "#45475C",
		},
		inactive_tab = {
			italic = true,
			bg_color = "#1E1E2F",
			fg_color = "#45475C",
		},
		active_tab = {
			bg_color = "#1E1E2F",
			fg_color = "#B2BEFF",
		},
		new_tab = {
			bg_color = "#1E1E2F",
			fg_color = "#45475C",
		},
		new_tab_hover = {
			bg_color = "#181827",
			fg_color = "#45475C",
		},
	},
}

config.line_height = 1.05
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 14
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.initial_cols = 97
config.initial_rows = 28

config.default_cwd = wezterm.home_dir .. "/dev"

config.freetype_load_target = "Light"

return config
