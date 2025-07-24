local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "-l" }

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

-- Multiplexer domains
config.unix_domains = {
	-- [batchinfotech]
	{
		name = "bit",
		connect_automatically = false, -- Do not launch or connect unless called
	},
}

-- Keybinding: Manually launch bit session
wezterm.on("spawn-bit-mux-session", function(_)
	local domain_to_use = "bit"

	-- if the mux server isn't running, this will launch it
	local tab1, pane1, win1 = mux.spawn_window({
		workspace = "bit",
		cwd = "D:\\Code\\softwares\\batchinfotech\\QBmirror",
		args = { "lazygit" },
		domain = { DomainName = domain_to_use },
	})
	tab1:set_title(" Lazygit")

	local tab2, pane2, window2 = win1:spawn_tab({
		cwd = "D:\\Code\\softwares\\batchinfotech\\QBmirror",
		-- args = { "source ~/.secrets && gemini" },
		domain = { DomainName = domain_to_use },
	})
	tab2:set_title(" Gemini CLI")
	pane2:send_text("source ~/.secrets && gemini\n")

	local tab3 = win1:spawn_tab({
		cwd = "E:\\work\\fulltime\\batchinfotech\\QBmirror",
		args = { "nvim" },
		domain = { DomainName = domain_to_use },
	})
	tab3:set_title(" Neovim")

	-- win1:gui_window():perform_action(wezterm.action.ActivateTab(tab3:tab_index()), pane1)
end)

-- Tmux keybinds
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "p",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "\\",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}

for i = 1, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		mods = "LEADER",
		key = tostring(i),
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Example: trigger the mux windows for batchinfotech
table.insert(config.keys, {
	mods = "LEADER",
	key = "b",
	action = wezterm.action.EmitEvent("spawn-bit-mux-session"),
})

config.check_for_updates = false
config.color_scheme = "gruvbox_material_dark_hard"
-- config.color_scheme = "Catppuccin Macchiato"
config.enable_scroll_bar = true
config.enable_wayland = false
config.font = wezterm.font("SFMono Nerd Font")
config.font_size = 10
config.initial_cols = 120
config.initial_rows = 35
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

-- Tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#1D2021" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#3C3836" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#eddeb5" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
