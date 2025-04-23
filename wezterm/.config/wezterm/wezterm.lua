local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.check_for_updates = false
config.color_scheme = "hardhacker"
config.enable_scroll_bar = true
config.enable_wayland = false
config.font = wezterm.font("SF Mono")
config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 35
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

return config
