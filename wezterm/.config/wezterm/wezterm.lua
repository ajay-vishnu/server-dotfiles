local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_schemes = {
	["gruvbox_material_dark_hard"] = {
		foreground = "#D4BE98",
		background = "#1D2021",
		cursor_bg = "#D4BE98",
		cursor_border = "#D4BE98",
		cursor_fg = "#1D2021",
		selection_bg = "#D4BE98",
		selection_fg = "#3C3836",

		ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	},
	["gruvbox_material_dark_medium"] = {
		foreground = "#D4BE98",
		background = "#282828",
		cursor_bg = "#D4BE98",
		cursor_border = "#D4BE98",
		cursor_fg = "#282828",
		selection_bg = "#D4BE98",
		selection_fg = "#45403d",

		ansi = { "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	},
	["gruvbox_material_dark_soft"] = {},
	["gruvbox_material_light_hard"] = {
		foreground = "#654735",
		background = "#F9F5D7",
		cursor_bg = "#654735",
		cursor_border = "#654735",
		cursor_fg = "#F9F5D7",
		selection_bg = "#F3EAC7",
		selection_fg = "#4F3829",

		ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	},
	["gruvbox_material_light_medium"] = {},
	["gruvbox_material_light_soft"] = {},
}

config.check_for_updates = false
config.color_scheme = "gruvbox_material_dark_hard"
config.enable_scroll_bar = true
config.enable_wayland = false
config.font = wezterm.font("SF Mono")
config.font_size = 10
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 35
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

wezterm.on("user-var-changed", function(window, pane, name, value)
	userVars = pane:get_user_vars()
	overrides = window:get_config_overrides() or {}
	print(overrides)
	if string.match(userVars["WEZTERM_PROG"], "nvim") then
		overrides.font = wezterm.font({
			family = "Comic Code Ligatures", -- The Font in Nvim
		})
	else
		overrides = nil
	end
	window:set_config_overrides(overrides)
end)

return config
