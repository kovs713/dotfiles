local terminal = "xdg-terminal-exec"

local function bind(keys, desc, dispatcher, opts)
	opts = opts or {}
	opts.description = desc
	hl.bind(keys, dispatcher, opts)
end

local function exec(keys, desc, cmd, opts)
	bind(keys, desc, hl.dsp.exec_cmd(cmd), opts)
end

local function unbind(keys)
	pcall(function()
		hl.unbind(keys)
	end)
end

for _, keys in ipairs({
	"SUPER + C",
	"SUPER + F",
	"SUPER + H",
	"SUPER + J",
	"SUPER + K",
	"SUPER + L",
	"SUPER + P",
	"SUPER + Q",
	"SUPER + V",
	"SUPER + W",
	"SUPER + slash",
	"SUPER + code:61",
	"SUPER + SHIFT + P",
	"SUPER + CTRL + H",
	"SUPER + CTRL + L",
	"SUPER + CTRL + R",
}) do
	unbind(keys)
end

exec(
	"XF86AudioRaiseVolume",
	"Volume up",
	"omarchy-swayosd-client --output-volume raise",
	{ locked = true, repeating = true }
)
exec(
	"XF86AudioLowerVolume",
	"Volume down",
	"omarchy-swayosd-client --output-volume lower",
	{ locked = true, repeating = true }
)
exec("XF86AudioMute", "Mute", "omarchy-swayosd-client --output-volume mute-toggle", { locked = true, repeating = true })
exec("XF86AudioMicMute", "Mute microphone", "omarchy-audio-input-mute", { locked = true, repeating = true })
exec("XF86MonBrightnessUp", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })
exec("XF86MonBrightnessDown", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })
exec(
	"SHIFT + XF86MonBrightnessUp",
	"Brightness maximum",
	"omarchy-brightness-display 100%",
	{ locked = true, repeating = true }
)
exec(
	"SHIFT + XF86MonBrightnessDown",
	"Brightness minimum",
	"omarchy-brightness-display 1%",
	{ locked = true, repeating = true }
)
exec(
	"XF86KbdBrightnessUp",
	"Keyboard brightness up",
	"omarchy-brightness-keyboard up",
	{ locked = true, repeating = true }
)
exec(
	"XF86KbdBrightnessDown",
	"Keyboard brightness down",
	"omarchy-brightness-keyboard down",
	{ locked = true, repeating = true }
)
exec("XF86KbdLightOnOff", "Keyboard backlight cycle", "omarchy-brightness-keyboard cycle", { locked = true })
exec("XF86TouchpadToggle", "Toggle touchpad", "omarchy-toggle-touchpad", { locked = true })
exec("XF86TouchpadOn", "Enable touchpad", "omarchy-toggle-touchpad on", { locked = true })
exec("XF86TouchpadOff", "Disable touchpad", "omarchy-toggle-touchpad off", { locked = true })
exec(
	"ALT + XF86AudioRaiseVolume",
	"Volume up precise",
	"omarchy-swayosd-client --output-volume +1",
	{ locked = true, repeating = true }
)
exec(
	"ALT + XF86AudioLowerVolume",
	"Volume down precise",
	"omarchy-swayosd-client --output-volume -1",
	{ locked = true, repeating = true }
)
exec(
	"ALT + XF86MonBrightnessUp",
	"Brightness up precise",
	"omarchy-brightness-display +1%",
	{ locked = true, repeating = true }
)
exec(
	"ALT + XF86MonBrightnessDown",
	"Brightness down precise",
	"omarchy-brightness-display 1%-",
	{ locked = true, repeating = true }
)
exec("XF86AudioNext", "Next track", "omarchy-swayosd-client --playerctl next", { locked = true })
exec("XF86AudioPause", "Pause", "omarchy-swayosd-client --playerctl play-pause", { locked = true })
exec("XF86AudioPlay", "Play", "omarchy-swayosd-client --playerctl play-pause", { locked = true })
exec("XF86AudioPrev", "Previous track", "omarchy-swayosd-client --playerctl previous", { locked = true })
exec("SUPER + XF86AudioMute", "Switch audio output", "omarchy-audio-output-switch", { locked = true })

exec("SUPER + SHIFT + ALT + M", "Music TUI", "omarchy-launch-or-focus-tui cliamp")
exec("SUPER + SHIFT + D", "Docker", "omarchy-launch-tui lazydocker")
exec("SUPER + SHIFT + O", "Obsidian", 'omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"')

exec("SUPER + SPACE", "Launch apps", "omarchy-launch-walker")
exec("SUPER + CTRL + E", "Emoji picker", "omarchy-launch-walker -m symbols")
exec("SUPER + CTRL + C", "Capture menu", "omarchy-menu capture")
exec("SUPER + CTRL + O", "Toggle menu", "omarchy-menu toggle")
exec("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu")
exec("SUPER + Escape", "System menu", "omarchy-menu system")
exec("XF86PowerOff", "Power menu", "omarchy-menu system", { locked = true })
exec("SUPER + SHIFT + SPACE", "Toggle top bar", "omarchy-toggle-waybar")
exec("SUPER + CTRL + SPACE", "Theme background menu", "omarchy-menu background")
exec("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "omarchy-menu theme")
exec("SUPER + BACKSPACE", "Toggle window transparency", "omarchy-hyprland-window-transparency-toggle")
exec("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "omarchy-hyprland-window-gaps-toggle")
exec(
	"SUPER + CTRL + BACKSPACE",
	"Toggle single-window square aspect",
	"omarchy-hyprland-window-single-square-aspect-toggle"
)
exec("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
exec("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
exec("SUPER + CTRL + COMMA", "Toggle silencing notifications", "omarchy-toggle-notification-silencing")
exec("SUPER + ALT + COMMA", "Invoke last notification", "makoctl invoke")
exec("SUPER + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")
exec("SUPER + CTRL + I", "Toggle locking on idle", "omarchy-toggle-idle")
exec("SUPER + CTRL + N", "Toggle nightlight", "omarchy-toggle-nightlight")
exec("SUPER + CTRL + Delete", "Toggle laptop display", "omarchy-hyprland-monitor-internal toggle")
exec(
	"SUPER + CTRL + ALT + Delete",
	"Toggle laptop display mirroring",
	"omarchy-hyprland-monitor-internal-mirror toggle"
)
exec(
	"switch:on:Lid Switch",
	"Laptop display off",
	"omarchy-hw-external-monitors && omarchy-hyprland-monitor-internal off",
	{ locked = true }
)
exec("switch:off:Lid Switch", "Laptop display on", "omarchy-hyprland-monitor-internal on", { locked = true })
exec("Print", "Screenshot", "omarchy-capture-screenshot")
exec("ALT + Print", "Screenrecording", "omarchy-menu screenrecord")
exec("SUPER + Print", "Color picker", "pkill hyprpicker || hyprpicker -a")
exec("SUPER + CTRL + Print", "OCR screenshot", "omarchy-capture-text-extraction")
exec("SUPER + CTRL + S", "Share", "omarchy-menu share")
exec("SUPER + CTRL + PERIOD", "Transcode", "omarchy-transcode")
exec("SUPER + SHIFT + CTRL + R", "Clear reminders", "omarchy-reminder clear")
exec("SUPER + CTRL + ALT + R", "Show reminders", "omarchy-reminder show")
exec("SUPER + CTRL + ALT + T", "Show time", "notify-send -u low \"$(date '+%A %H:%M - %d %B %Y - Week %V')\"")
exec("SUPER + CTRL + ALT + B", "Show battery", 'notify-send -u low "$(omarchy-battery-status)"')
exec("SUPER + CTRL + ALT + W", "Show weather", 'notify-send -u low "$(omarchy-weather-status)"')
exec("SUPER + CTRL + A", "Audio controls", "omarchy-launch-audio")
exec("SUPER + CTRL + B", "Bluetooth controls", "omarchy-launch-bluetooth")
exec("SUPER + CTRL + W", "Wifi controls", "omarchy-launch-wifi")
exec("SUPER + CTRL + T", "Activity", "omarchy-launch-tui btop")
exec("SUPER + CTRL + X", "Toggle dictation", "voxtype record toggle")
exec("F9", "Start dictation", "voxtype record start")
exec("F9", "Stop dictation", "voxtype record stop", { release = true })
exec(
	"SUPER + CTRL + Z",
	"Zoom in",
	"hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')"
)
exec("SUPER + CTRL + ALT + Z", "Reset zoom", "hyprctl keyword cursor:zoom_factor 1")

-- Restored local bindings from bindings.conf.bak.1782381293.
bind("SUPER + R", "Column wider", hl.dsp.layout("colresize +conf"))
bind("SUPER + SHIFT + R", "Column narrower", hl.dsp.layout("colresize -conf"))
bind("SUPER + SHIFT + P", "Pin window", hl.dsp.window.pin())
exec("SUPER + Q", "Terminal", terminal)
exec("SUPER + D", "Wlr which key", "$HOME/dotfiles/scripts/wlr-which-key-themed.sh")
exec("SUPER + E", "File manager", "nautilus")
exec("SUPER + CTRL + P", "Poweroff", "poweroff")
exec("SUPER + CTRL + R", "Reboot", "reboot")
exec("SUPER + SHIFT + S", "Region capture", "hyprshot -m region --clipboard-only -z -s --cursor=false")
exec("SUPER + CTRL + SHIFT + S", "Window capture", "hyprshot -m window --clipboard-only -z -s --cursor=false")
exec("SUPER + V", "Clipboard history", "omarchy-launch-walker -m clipboard")
exec("SUPER + slash", "Show keybindings", "omarchy-menu-keybindings")
exec("SUPER + F6", "Suspend", "systemctl suspend")
exec("SUPER + F12", "Toggle autoclicker", "$HOME/dotfiles/scripts/toggle-clicker.sh")

bind("SUPER + P", "Fullscreen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
bind("SUPER + F", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
bind("SUPER + C", "Close window", hl.dsp.window.close())

bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
bind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))
bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))

bind("SUPER + SHIFT + H", "Move window left", hl.dsp.window.move({ direction = "l" }))
bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.move({ direction = "d" }))
bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.move({ direction = "u" }))
bind("SUPER + SHIFT + L", "Move window right", hl.dsp.window.move({ direction = "r" }))

bind("SUPER + CTRL + H", "Resize left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
bind("SUPER + CTRL + J", "Resize down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
bind("SUPER + CTRL + K", "Resize up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
bind("SUPER + CTRL + L", "Resize right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))

for i = 1, 10 do
	local code = 9 + i
	bind("SUPER + code:" .. code, "Switch workspace " .. i, hl.dsp.focus({ workspace = i }))
	bind("SUPER + SHIFT + code:" .. code, "Move window to workspace " .. i, hl.dsp.window.move({ workspace = i }))
end

bind("SUPER + Tab", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
bind("SUPER + SHIFT + Tab", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
bind("SUPER + CTRL + Tab", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
bind("SUPER + Left", "Focus left", hl.dsp.focus({ direction = "l" }))
bind("SUPER + Right", "Focus right", hl.dsp.focus({ direction = "r" }))
bind("SUPER + Up", "Focus up", hl.dsp.focus({ direction = "u" }))
bind("SUPER + Down", "Focus down", hl.dsp.focus({ direction = "d" }))
bind("SUPER + SHIFT + Left", "Swap window left", hl.dsp.window.swap({ direction = "l" }))
bind("SUPER + SHIFT + Right", "Swap window right", hl.dsp.window.swap({ direction = "r" }))
bind("SUPER + SHIFT + Up", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
bind("SUPER + SHIFT + Down", "Swap window down", hl.dsp.window.swap({ direction = "d" }))
bind("ALT + Tab", "Next window", hl.dsp.window.cycle_next({ next = true }))
bind("ALT + SHIFT + Tab", "Previous window", hl.dsp.window.cycle_next({ next = false }))
bind("SUPER + mouse_down", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
bind("SUPER + mouse_up", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
bind("SUPER + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
bind("SUPER + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })
bind("SUPER + ALT + mouse:272", "Resize window", hl.dsp.window.resize(), { mouse = true })
