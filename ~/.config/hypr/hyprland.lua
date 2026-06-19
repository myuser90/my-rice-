-- PLEASE GO TO LINE 95
--UNDER THE LOOK AND FEEL SECTION
--ALSO IF YOU SEE ANY SPELLING MISTAKES
--THATS NORMAL I HAVE BEEN BARELY GETTING ANY SLEEP
--LATELY AND HAVE BEEN COMPILING
--FOR FIVE DAYS STRAIGHT
--NON STOP

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)
hl.on("hyprland.start", function()
	hl.exec_cmd("wl-paste --watch cliphist store")
end)

hl.on("hyprland.start", function()
	hl.exec_cmd("mako")
end)

hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img ~/pictures/wallpapers/14. Sci-fi.jpg")
end)
hl.on("hyprland.start", function()
	hl.exec_cmd("pkill waybar; waybar")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
-- IMPORTANT!!! READ THE FOLLOWING TEXT TO UNDERSTAND MY WEIRD NAMING OF THINGS
-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
-- ==========================================
-- this was a cattpuccin mocha rice but
-- decided to m ke it look more cyerpunk
-- also this rice was on my arch setup but since
-- i have moved to gentoo i decided to
-- change things a bit
-- VISUAL SYSTEM FOUNDATION LAYER
-- ==========================================

-- ==========================================
-- change to your liking
-- ==========================================

hl.config({
	general = {

		-- Internal spacing (UI breathing room between windows)
		gaps_in = 6,

		-- External spacing (separation from screen edges)
		gaps_out = 14,

		-- Window frame thickness (visual containment boundary)
		border_size = 2,

		-- Active / inactive border system (state feedback layer)
		col = {
			active_border = {
				colors = {
					"rgba(4fd6becc)", -- Gentoo sys signal (primary active state)
					"rgba(b4befecc)", -- Secondary accent layer (depth gradient)
				},
				angle = 45,
			},

			inactive_border = "rgba(31324488)",
		},

		-- Interaction behavior (direct manipulation toggle)
		resize_on_border = false,

		-- Experimental rendering behavior (kept stable off)
		allow_tearing = false,

		-- Window layout engine (tiling strategy)
		layout = "dwindle",
	},

	-- ==========================================
	-- VISUAL DECORATION SYSTEM (DEPTH + GLASS LAYER)
	-- ALSO i was into the glassy look of mac os
	-- so it kinda affected me
	-- ==========================================

	decoration = {

		-- Corner language (soft cyber glass geometry)
		rounding = 14,

		-- Controls curvature falloff (visual softness intensity curve)
		rounding_power = 4,

		-- ======================================
		-- OPACITY SYSTEM (FOREGROUND AND BACKGROUND SEPARATION)
		-- ======================================

		active_opacity = 0.98,
		inactive_opacity = 0.90,

		-- ======================================
		-- DEPTH SYSTEM (SHADOW = LAYER SEPARATION)
		-- ======================================

		shadow = {
			enabled = true,
			range = 18,
			render_power = 3,
			color = "rgba(000000cc)",
		},

		-- ======================================
		-- GLASS SYSTEM (ATMOSPHERIC UI LAYER)
		-- ======================================

		blur = {
			enabled = true,

			-- blur radius (softness of background separation)
			size = 7,

			-- sampling passes (quality vs performance balance)
			passes = 2,

			-- subtle color lift for cyber glass aesthetic
			vibrancy = 0.12,
		},
	},

	-- ==========================================
	-- MOTION SYSTEM INTEGRATION (GLOBAL TOGGLE)
	-- ==========================================

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- ======================================================================
-- I GUESS BY NOW YOU SEE HOW I WAS AFFETCED BY DIFFRENT THEMES AND LOOKS
-- ======================================================================

-- CORE BEZIERS (rebalanced for cyber UI feel discarding cattpuccin slowly here)
hl.curve("cyberFast", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.curve("cyberSmooth", {
	type = "bezier",
	points = { { 0.4, 0 }, { 0.2, 1 } },
})

hl.curve("cyberSoft", {
	type = "bezier",
	points = { { 0.22, 1 }, { 0.36, 1 } },
})

hl.curve("cyberLinear", {
	type = "bezier",
	points = { { 0.25, 0.25 }, { 0.75, 0.75 } },
})

-- SPRING (kept but tightened for less floaty feel)
hl.curve("cyberSpring", {
	type = "spring",
	mass = 1,
	stiffness = 85,
	dampening = 20,
})
-- ==========================================
-- this is also for the cyber look
-- SEMANTIC UI ANIMATION SYSTEM
-- ==========================================

-- ==========================================
-- (DESIGN SYSTEM FOUNDATION)
-- ==========================================

-- Instant (no perceptible delay, for UI responsiveness)
hl.curve("motion_instant", {
	type = "bezier",
	points = { { 0.0, 1.0 }, { 0.0, 1.0 } },
})

-- Fast (system feedback, navigation, borders)
hl.curve("motion_fast", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

-- Standard (default UI transitions)
hl.curve("motion_standard", {
	type = "bezier",
	points = { { 0.4, 0 }, { 0.2, 1 } },
})

-- Soft (background / non-critical transitions)
hl.curve("motion_soft", {
	type = "bezier",
	points = { { 0.22, 1 }, { 0.36, 1 } },
})

-- Spring (primary window physics feel)
hl.curve("motion_spring", {
	type = "spring",
	mass = 1,
	stiffness = 85,
	dampening = 20,
})

-- ==========================================
-- GLOBAL MOTION BASELINE (DEFAULT SYSTEM BEHAVIOR)
-- i also did not want to lose the snappy feeling you know
-- ==========================================

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 1,
	bezier = "motion_standard",
})

-- ==========================================
-- (HIGH PRIORITY UI SIGNALS)
-- ==========================================

-- Borders react instantly (system state feedback)
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 9,
	bezier = "motion_fast",
})

-- Workspace switching (navigation layer)
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3.8,
	bezier = "motion_fast",
	style = "slidefade",
})

hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 4.2,
	bezier = "motion_fast",
	style = "fade",
})

hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 4.2,
	bezier = "motion_fast",
	style = "fade",
})

-- ==========================================
-- WINDOW MOTION LAYER (PRIMARY USER SPACE)
-- ==========================================

-- Core window physics
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 5.0,
	spring = "motion_spring",
})

-- Window enter (focus attention)
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 5.0,
	spring = "motion_spring",
	style = "popin 92%",
})

-- Window exit (de-emphasize smoothly)
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 4.5,
	bezier = "motion_soft",
	style = "popin 94%",
})

-- ==========================================
-- BACKGROUND / LAYER SYSTEM (DEPTH + ATMOSPHERE)
-- ==========================================

-- Generic fade system (single source of truth)
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 4.0,
	bezier = "motion_soft",
})

-- UI layer transitions (overlays, panels, etc.)
hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 4.5,
	bezier = "motion_standard",
})

hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4.5,
	bezier = "motion_standard",
	style = "fade",
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 4.0,
	bezier = "motion_soft",
	style = "fade",
})

-- ==========================================
-- SPECIAL FOCUS BEHAVIOR (ATTENTION SYSTEM)
-- ==========================================

hl.animation({
	leaf = "zoomFactor",
	enabled = true,
	speed = 5.2,
	bezier = "motion_standard",
})
-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "fr",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- wallpaper script switcher

--hl.bind("SUPER + W", hl.dsp.exec_cmd("~/wallscript.sh"))

-- clip menu
hl.bind("SUPER + M", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd('grim -g "$(slurp)" ~/pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png')
)

hl.bind("SUPER + W", hl.dsp.exec_cmd("grim ~/pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"))

--hyprlock
--hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Switch workspaces with mainMod + a to y
-- for some reason super + NUMBER does not work
-- so i used the a z e r t y keys to change workspaces
local workspaces = {
	"A",
	"Z",
	"E",
	"R",
	"T",
	"Y",
	"U",
	"I",
	"O",
	"P",
}

for i, key in ipairs(workspaces) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
