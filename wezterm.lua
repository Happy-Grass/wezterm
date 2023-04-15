local wezterm = require("wezterm")

local launch_menu = {}
local default_prog = {}
local set_environment_variables = {}

-- Shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "ArchLinux",
		args = { "C:/WINDOWS/system32/wsl.exe", "--cd", "/home/xfw" },
		cwd = "~",
	})
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	-- default_prog = { "ArchLinux" }
	default_prog = { "C:/WINDOWS/system32/wsl.exe", "--cd", "/home/xfw" }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	table.insert(launch_menu, {
		label = "bash",
		args = { "bash", "-l" },
	})
	default_prog = { "bash", "-l" }
else
	table.insert(launch_menu, {
		label = "zsh",
		args = { "zsh", "-l" },
	})
	default_prog = { "zsh", "-l" }
end

local config = {
	-- Basic
	initial_rows = 35,
	initial_cols = 120,
	window_close_confirmation = "NeverPrompt",
	check_for_updates = false,
	switch_to_last_active_tab_when_closing_tab = false,
	enable_scroll_bar = false,
	--Background
	-- window_background_image = "C:/Users/xfwah/OneDrive/Pictures/Saved Pictures/windows.jpg",
	-- Window
	window_decorations = "TITLE|RESIZE", --RESIZE
	window_frame = {
		inactive_titlebar_bg = "#003535",
		active_titlebar_bg = "#2b4042",
		inactive_titlebar_fg = "#cccccc",
		active_titlebar_fg = "#019347",
		inactive_titlebar_border_bottom = "#002042",
		active_titlebar_border_bottom = "#009347",
		button_fg = "#cccccc",
		button_bg = "#2b2042",
		button_hover_fg = "#2b2042",
		button_hover_bg = "#3b3052",
		border_left_width = "0.0cell",
		border_right_width = "0.0cell",
		border_bottom_height = "0.00cell",
		border_top_height = "0.00cell",
		border_left_color = "#66ccff",
		border_right_color = "#66ccff",
		border_bottom_color = "#66ccff",
		border_top_color = "#66ccff",
	},
	native_macos_fullscreen_mode = true,
	adjust_window_size_when_changing_font_size = true,
	window_background_opacity = 0.95,
	text_background_opacity = 0.95,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_background_image_hsb = {
		brightness = 0.8,
		hue = 1.0,
		saturation = 1.0,
	},
	-- Font
	font = wezterm.font_with_fallback({
		{
			family = "FiraCode Nerd Font",
			weight = "Regular",
			harfbuzz_features = { "zero", "ss01", "cv05" },
		},
		"KaiTi",
	}),
	font_size = 12,
	normalize_to_nfc = true,
	-- Tab bar
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = false,
	tab_max_width = 25,
	-- Keys
	disable_default_key_bindings = false,
	disable_default_mouse_bindings = false,
	leader = {
		key = "x",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	},
	-- Allow using ^ with single key press.
	use_dead_keys = false,
	keys = {
		{
			key = "q",
			mods = "LEADER",
			action = wezterm.action.QuitApplication,
		},
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action.Hide,
		},
	},
	mouse_bindings = {
		{
			event = { Drag = { streak = 1, button = "Left" } },
			mods = "CTRL|SHIFT",
			action = wezterm.action.StartWindowDrag,
		},
	},
	color_scheme = "Catppuccin Mocha",
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	default_prog = default_prog,
	set_environment_variables = set_environment_variables,
	launch_menu = launch_menu,
}

return config
