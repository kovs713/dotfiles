hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

hl.workspace_rule({
	workspace = "5",
	layout_opts = { direction = "left" },
})

hl.window_rule({
	name = "override-opacity",
	match = { class = ".*" },
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	name = "amneziavpn",
	match = { class = "(AmneziaVPN)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "throne",
	match = { class = "(Throne)$" },
	float = true,
})

hl.window_rule({
	name = "file-manager",
	match = { class = "(org.gnome.Nautilus)$" },
	float = true,
	center = true,
	size = { 1100, 600 },
})

hl.window_rule({
	name = "choose-file",
	match = { title = "(Choose Files)$" },
	float = true,
	center = true,
	size = { 1100, 600 },
})

hl.window_rule({
	name = "browsers-ws1",
	match = {
		class = "(zen|Zen|firefox|Firefox|librewolf|LibreWolf|floorp|Mercury|chromium|Chromium|chrome|Chrome|brave|Brave|microsoft-edge|Edge|waterfox|Waterfox|thorium|Thorium)",
	},
	workspace = "1 silent",
})

hl.window_rule({
	name = "gtk-file-upload",
	match = { class = "(xdg-desktop-portal-gtk)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "web-devtools",
	match = { class = "(zen-browser)", title = "(Developer Tools)$" },
	float = true,
	workspace = "1 silent",
})

hl.window_rule({
	name = "work-ws2",
	match = {
		class = "(code|Code|code-oss|Code-OSS|codium|Codium|VSCodium|dev.zed.Zed|Zed|subl|CodeBlocks|codeblocks|jetbrains-idea|IntelliJ|CLion|PyCharm|WebStorm|PhpStorm|rider|datagrip|goland|rustrover|android-studio|Studio)",
	},
	workspace = "2 silent",
})

hl.window_rule({
	name = "spotify",
	match = { class = "(Spotify)" },
	float = true,
	center = true,
	size = { 1000, 700 },
})

hl.window_rule({
	name = "social-ws5",
	match = {
		class = "(discord|Discord|Vesktop|telegram|Telegram|AyuGram|ayugram|org.telegram.desktop|WebCord|webcord)",
	},
	workspace = "5 silent",
})

hl.window_rule({
	name = "sound-control",
	match = { class = "(org.omarchy.wiremix)$" },
	float = true,
	center = true,
	size = { 1160, 630 },
})

hl.window_rule({
	name = "bluetooth",
	match = { class = "(org.omarchy.bluetui)$" },
	float = true,
	center = true,
	size = { 1160, 630 },
})

hl.window_rule({
	name = "qt",
	match = { class = "(qt.*ct)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "anki",
	match = { class = "anki", initial_class = "User 1 - Anki" },
	float = false,
	center = true,
	workspace = "10 silent",
})
