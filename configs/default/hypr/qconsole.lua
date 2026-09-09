-- Scratchpad override: no half-screen Quake, AyuGram instead of agent.
-- Original: share=0.5 (half-screen) + seed=omarchy-agent

-- 1.0 = full workspace (no bottom gap), rm half-screen
local share = 1.0

-- open AyuGram if scratchpad is empty. Safe: move only AyuGram, not active window.
local seed =
	'sh -c \'hyprctl eval "for _,w in ipairs(hl.get_windows()) do if w.class==\\"com.ayugram.desktop\\" or w.class==\\"AyuGram\\" or w.class==\\"org.telegram.desktop\\" then hl.dispatch(hl.dsp.focus({window=w.address})); hl.dispatch(hl.dsp.window.move({workspace=\\"special:scratchpad\\"})); break end end" 2>/dev/null; pgrep -x AyuGram >/dev/null || hyprctl eval "hl.exec_cmd(\\"AyuGram\\", {workspace=\\"special:scratchpad silent\\"})"\''

-- Dimming only applies while a special workspace is open, so the console gets
-- its separation from the workspace underneath without costing anything the
-- rest of the time.
hl.config({
	decoration = {
		dim_special = 0.6,
	},
})

-- Refitting replaces the rule in place rather than stacking a new one, but it
-- still schedules a monitor and window state refresh, and monitor.focused fires
-- on every hop between screens. Most of those hops do not change the number, so
-- only write the rule when it actually moves.
local covering = nil

local function cover(bottom)
	if covering == bottom then
		return
	end
	covering = bottom

	hl.workspace_rule({
		workspace = "special:scratchpad",
		gaps_in = 0,
		gaps_out = { top = 0, right = 0, bottom = bottom, left = 0 },

		-- Nothing to highlight in a console that is only ever focused when it is
		-- open, and the active border reads as a stray frame around a panel that
		-- is already set apart by the dimming behind it.
		no_border = true,

		on_created_empty = seed,
	})
end

-- Sizing the console with a window rule would freeze it at whatever the screen
-- measured when it first opened, because Hyprland resolves those expressions
-- once, as the window maps. Rescaling the monitor afterwards would leave a
-- console that is no longer half of anything. Gaps are re-applied by the layout
-- instead, so the console is sized by the gap left underneath it and that gap
-- is recomputed whenever the monitor layout changes.
local function fit()
	local monitor = hl.get_active_monitor()

	-- A monitor handle whose output has gone away answers nil to every field, and
	-- layout changes are exactly when that happens, so this also covers reading
	-- height and reserved below.
	if not monitor or not monitor.scale or monitor.scale <= 0 then
		return
	end

	-- Monitor dimensions are in physical pixels; gaps are logical, so the scale
	-- has to come out before the reserved area (already logical) comes off.
	local reserved = monitor.reserved
	local usable = monitor.height / monitor.scale - reserved.top - reserved.bottom

	cover(math.max(0, math.floor(usable * (1 - share))))
end

-- Until a monitor can be read, cover the whole work area rather than leaving
-- the console unruled, so it is never seeded without its placement.
cover(0)
fit()

hl.on("monitor.layout_changed", fit)
hl.on("monitor.focused", fit)

-- The direction names the edge the offset is measured from, not where the
-- workspace goes: "slide top" drops it down into view, and "slide bottom"
-- retracts it back up the way a Quake console does.
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slide top" })
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 2,
	bezier = "easeInOutCubic",
	style = "slide bottom",
})
