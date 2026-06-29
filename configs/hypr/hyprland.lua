for _, module in ipairs({
	"envs",
	"monitors",
	"input",
	"looknfeel",
	"windows",
	"autostart",
	"bindings",
}) do
	package.loaded[module] = nil
	require(module)
end

package.path = os.getenv("HOME")
	.. "/.config/?.lua;"
	.. (os.getenv("OMARCHY_PATH") or (os.getenv("HOME") .. "/.local/share/omarchy"))
	.. "/?.lua;"
	.. package.path

require("default.hypr.omarchy")

require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

require("default.hypr.toggles")
