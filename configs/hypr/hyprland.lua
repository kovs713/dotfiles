dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

require("default.hypr.omarchy")

-- ~/.config/hypr files.
require("hypr.autostart")
require("hypr.envs")
require("hypr.input")
require("hypr.looknfeel")
require("hypr.monitors")
require("hypr.bindings")
require("hypr.windows")

-- Toggle config flags dynamically.
require("default.hypr.toggles")
