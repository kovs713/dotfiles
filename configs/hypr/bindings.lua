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
	"SUPER + SHIFT + SPACE",
	"SUPER + SHIFT + P",
	"SUPER + CTRL + H",
	"SUPER + CTRL + L",
	"SUPER + CTRL + R",
	"SUPER + SHIFT + S",
}) do
	unbind(keys)
end

exec("SUPER + SHIFT + SPACE", "Toggle top bar", "omarchy toggle waybar")
exec("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
exec("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")

bind("SUPER + R", "Column wider", hl.dsp.layout("colresize +conf"))
bind("SUPER + SHIFT + R", "Column narrower", hl.dsp.layout("colresize -conf"))
bind("SUPER + SHIFT + P", "Pin window", hl.dsp.window.pin())
exec("SUPER + Q", "Terminal", terminal)
exec("SUPER + D", "Wlr which key", "$HOME/dotfiles/scripts/wlr-which-key-themed.sh")
exec("SUPER + E", "File manager", "nautilus")
exec("SUPER + CTRL + P", "Poweroff", "omarchy system shutdown")
exec("SUPER + CTRL + R", "Reboot", "omarchy system reboot")
exec("SUPER + SHIFT + S", "Region capture", "hyprshot -m region --clipboard-only -z -s --cursor=false")
exec("SUPER + CTRL + SHIFT + S", "Window capture", "hyprshot -m window --clipboard-only -z -s --cursor=false")
exec("SUPER + V", "Clipboard history", "omarchy launch walker -m clipboard")
exec("SUPER + slash", "Show keybindings", "omarchy menu keybindings")
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
