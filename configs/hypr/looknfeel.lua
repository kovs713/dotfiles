local function theme_color(name)
	local colors = io.open(os.getenv("HOME") .. "/.local/state/omarchy/current/theme/colors.toml", "r")
	if not colors then
		return nil
	end

	for line in colors:lines() do
		local color = line:match("^%s*" .. name .. '%s*=%s*"#?([%x]+)"')
		if color then
			colors:close()
			return color
		end
	end

	colors:close()
	return nil
end

local function rgba(hex)
	return "rgba(" .. hex .. (#hex == 6 and "ff" or "") .. ")"
end

local active_border = theme_color("active_border_color") or theme_color("accent") or "ff8c00"

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 1,
		["col.active_border"] = rgba(active_border),
		["col.inactive_border"] = "rgba(00000000)",
		layout = "scrolling",
	},
	scrolling = {
		column_width = 0.5,
		fullscreen_on_one_column = true,
	},
	decoration = {
		rounding = 0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		dim_inactive = false,
		dim_strength = 0.5,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = true,
		},
	},
	layout = {
		single_window_aspect_ratio = "0 0",
	},
	animations = {
		enabled = false,
	},
})
