-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("update-right-status", function(window, _)
	local date = wezterm.strftime("%d-%a %H:%M:%S")

	-- Make it italic and underlined
	window:set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = date },
	}))
end)

wezterm.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "tokyonight_night"
	else
		-- color schemes I like
		-- "Google (light) (terminal.sexy)",
		-- "Google Light (Gogh)"
		-- "nord-light"
		-- "Homebrew Light (Gogh)"
		-- "Papercolor Light (Gogh)"
		-- "dayfox",

		--return "GruvboxLight"
		return "Rosé Pine Dawn (Gogh)"
	end
end

wezterm.on("window-config-reloaded", function(window, _)
	local overrides = window:get_config_overrides() or {}
	local appearance = wezterm.gui.get_appearance()
	appearance = "Light"
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

config = {
	check_for_updates = true,
	automatically_reload_config = true,
	default_cursor_style = "SteadyBar",

	-- For example, changing the color scheme:

	-- Tab settings
	hide_tab_bar_if_only_one_tab = false,
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	show_tab_index_in_tab_bar = true,

	window_background_opacity = 0.85,
	macos_window_background_blur = 10,
	window_close_confirmation = "AlwaysPrompt",

	-- What does this line even do?
	scrollback_lines = 3000,
	inactive_pane_hsb = {
		saturation = 0.30,
		brightness = 0.7,
	},
	window_decorations = "RESIZE",
	window_padding = {
		left = "2cell",
		right = "2cell",
		top = "0cell",
		bottom = "0cell",
	},
	window_frame = {
		border_left_width = "0.75px",
		border_right_width = "0.75px",
		border_bottom_height = "0.5px",
		border_top_height = "0.5px",
	},
	--font = wezterm.font("Fira Code"),
	font = wezterm.font("Fira Mono", { weight = "Bold" }),
	font_size = 16.0,

	-- keys
	keys = {
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by the tab
		{ key = "m", mods = "CMD", action = act.DisableDefaultAssignment },
		-- Clears the scrollback and viewport leaving the prompt line the new first line.
		{ key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },
		-- Move between panes
		{ key = "l", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Right") },
		{ key = "h", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Left") },
		{ key = "k", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "SHIFT|CMD", action = act.ActivatePaneDirection("Down") },
		-- Resolve this spliting pane issue
		{ key = "-", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- SHIFT is for when caps lock is on
		{ key = "|", mods = "SHIFT|CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "SHIFT|CMD", action = act.CloseCurrentPane({ confirm = true }) },
		-- Reset the font size to 16px
		{ key = "0", mods = "CMD", action = act.ResetFontSize },
	},
}

-- Tab settings
config.default_workspace = "home"
-- Dim inactive panes
-- Font

-- and finally, return the configuration to wezterm
return config
