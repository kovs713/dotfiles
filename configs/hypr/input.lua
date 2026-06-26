hl.config({
	input = {
		kb_layout = "us,ru",
		kb_options = "grp:alt_space_toggle,caps:escape",
		repeat_rate = 40,
		repeat_delay = 600,
		numlock_by_default = true,
		follow_mouse = 1,
		sensitivity = -0.75,
		touchpad = {
			natural_scroll = false,
			clickfinger_behavior = true,
			scroll_factor = 0.4,
		},
	},
})

hl.device({
	name = "pnp0c50:00-04f3:31ff-touchpad",
	sensitivity = 0.4,
	accel_profile = "flat",
})

hl.window_rule({
	match = { class = "(Alacritty|kitty|foot)" },
	scroll_touchpad = 1.5,
})

hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
	scroll_touchpad = 0.2,
})
