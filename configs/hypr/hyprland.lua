package.path = os.getenv("HOME")
	.. "/.config/?.lua;"
	.. (os.getenv("OMARCHY_PATH") or (os.getenv("HOME") .. "/.local/share/omarchy"))
	.. "/?.lua;"
	.. package.path

require("default.hypr.omarchy")

require("hypr.autostart")
require("hypr.envs")
require("hypr.input")
require("hypr.looknfeel")
require("hypr.monitors")
require("hypr.bindings")
require("hypr.windows")

require("default.hypr.toggles")
