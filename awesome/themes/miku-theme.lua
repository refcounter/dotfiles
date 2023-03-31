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


theme.name = "miku"

-- Font
--theme.font = "SF Pro Text 9"
--theme.title_font = "SF Pro Display Medium 10"

theme.font = "Tilt Neon Bold 9"
theme.title_font = "JetBrainsMono Nerd Font Bold 10"

-- Background
theme.bg_normal = "#5B60711A"
theme.bg_dark = "#090B0C"
theme.bg_focus = "#151821"
theme.bg_urgent = "#ed8274"
theme.bg_minimize = "#444444"
theme.magenta       = "#ba35af"
theme.magenta_alt   = "#8e44f3"
theme.cyan = "#00FFFF"
theme.border_normal             = theme.bg_focus
theme.border_focus              = theme.cyan


-- Foreground
theme.fg_normal = "#ffffff"
theme.fg_focus = "#e4e4e4"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

-- Gaps
theme.useless_gap = dpi(7)
theme.gap_single_client = true

-- Corner Radius of Rounded Windows
theme.corner_radius = dpi(20)

-- Window Borders
theme.border_marked = theme.fg_urgent
theme.useless_gap = dpi(2)
theme.border_width = dpi(2)
theme.border_radius = dpi(8)
theme.border_focus = theme.cyan


-- Taglist
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_urgent = "#e91e6399"
theme.taglist_fg_focus = "#ffffff"
theme.taglist_spacing = dpi(15)

theme.taglist_bg_focus = "#0CD7D8"
theme.taglist_fg_occupied = "#ababba"

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
theme.bg_systray = "#00000000"
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
