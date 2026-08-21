-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
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
