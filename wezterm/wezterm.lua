local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local colors, _ = wezterm.color.load_scheme("/Users/ser/.config/wezterm/mellow.toml")

colors.tab_bar = {
	background = "#2A2A2D",
	active_tab = {
		bg_color = "#161617",
		fg_color = "#C9C7CE",
	},
	inactive_tab = {
		italic = true,
		bg_color = "#1B1B1B",
		fg_color = "#757582",
	},
}

config.window_decorations = "RESIZE"
config.colors = colors

config.line_height = 1.05

config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 5,
}

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
config.harfbuzz_features = { "ss02", "ss19", "cv14", "cv16", "cv18", "cv08" }

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.initial_cols = 97
config.initial_rows = 28

config.default_cwd = wezterm.home_dir .. "/dev"

config.freetype_load_target = "Light"

return config
