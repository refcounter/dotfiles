
--      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
--      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
--         ██║   ███████║█████╗  ██╔████╔██║█████╗
--         ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
--         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
--         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi

-- define module table
local theme = {}


-- ===================================================================
-- Theme Variables
-- ===================================================================


theme.name = "norm"

-- Font
--theme.font = "SF Pro Text 9"
--theme.title_font = "SF Pro Display Medium 10"

theme.font = "Open Sans Bold 9"
theme.title_font = "Tilt Neon Bold 10"


theme.bg_normal    = "#fff2f3"
theme.fg_main      = "#4f4073"
theme.bg_minimize  = "#f2e4ea"
theme.fg_dim       = "#786e74"
theme.bg_alt       = "#efd3e4"
theme.fg_alt       = "#af4988"
theme.bg_active    = "#cfb3c4"
theme.active  = "#f7ebee"

theme.red           = "#d3303a"
theme.red_alt       = "#d50f7f"
theme.green         = "#217a3c"
theme.green_alt     = "#007f68"
theme.yellow        = "#a45f22"
theme.yellow_alt    = "#b65050"
theme.blue          = "#375ce6"
theme.blue_alt      = "#065fff"
theme.magenta       = "#ba35af"
theme.magenta_alt   = "#8e44f3"
theme.cyan          = "#1f6fbf"
theme.cyan_alt      = "#0f7b8f"

theme.bg_accent_alt = "#ffa4dc"
theme.fg_accent_alt = "#341f58"
theme.bg_accent     = "#004f6f"
theme.fg_accent     = "#ffffff"

--theme.mpc_color = "#FDF3EA"
--theme.mpc_bg = "#DB98BD"

theme.tray_bg = "#DB98BD21"

theme.transparent = "#00000000"
theme.black = "#16161D"

theme.fg_normal                 = theme.fg_accent
theme.fg_focus                  = theme.orange
theme.bg_normal                 = theme.bg_dim
theme.bg_focus                  = theme.bg_main
theme.fg_urgent                 = theme.red
theme.bg_urgent                 = theme.black
theme.border_normal             = theme.bg_main


-- spacing
theme.spacing = dpi(8)
theme.spacing_md = dpi(12)
theme.spacing_lg = dpi(16)
theme.spacing_xl = dpi(20)

theme.bar_height = dpi(25)

-- calendar
theme.calendar_fg_header = theme.fg_dim
theme.calendar_fg_focus = theme.bg_normal
theme.calendar_fg_weekday = theme.fg_accent_alt
theme.calendar_fg = theme.fg_normal
theme.calendar_bg = theme.bg_main
theme.calendar_bg_focus = theme.red_alt

theme.menubar_fg_focus          = theme.fg_accent_alt
theme.menubar_bg_focus          = theme.bg_accent_alt
theme.menubar_fg_normal         = theme.red
theme.menubar_bg_normal         = theme.bg_dim


-- Background
theme.bg_dark = "#090B0C"
theme.bg_minimize = "#444444"

-- Foreground
theme.fg_minimize = theme.fg_dim

-- Gaps
theme.gap_single_client = true

-- Corner Radius of Rounded Windows
theme.corner_radius = dpi(20)

-- Window Borders
theme.border_marked = theme.fg_urgent
theme.useless_gap = dpi(5)
theme.border_width = dpi(5)
theme.border_radius = dpi(10)
theme.border_focus = theme.yellow
theme.border_normal = theme.bg_normal

-- Taglist
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_urgent = "#e91e6399"
theme.taglist_fg_focus = "#ffffff"
theme.taglist_spacing = dpi(15)
theme.taglist_bg_focus = theme.yellow_alt
theme.taglist_fg_occupied = "#ababab"

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal

-- Panel Sizing
theme.bottom_panel_width = dpi(40)
theme.top_panel_height = dpi(30)

-- Notification Sizing
theme.notification_max_width = dpi(350)

-- System Tray
theme.bg_systray = theme.transparent
theme.systray_icon_spacing = dpi(5)


-- ===================================================================
-- Icons
-- ===================================================================


-- Define layout icons
theme.layout_tile = "~/.config/awesome/icons/layouts/tiled.png"
theme.layout_floating = "~/.config/awesome/icons/layouts/floating.png"
theme.layout_max = "~/.config/awesome/icons/layouts/maximized.png"

theme.icon_theme = "Tela-dark"


-- ===================================================================
-- Titlebars
-- ===================================================================


theme.titlebars_enabled = false
return theme
