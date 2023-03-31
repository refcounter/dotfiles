--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local dpi = beautiful.xresources.apply_dpi


local tag_list = require("widgets.tag-list")
local separator = require("widgets.horizontal-separator")
local folder = require("widgets.folder")
local utils = require("components.ui")

local home_dir = os.getenv("HOME")

-- define module table
local top_panel = {}


-- ===================================================================
-- Bar Creation
-- ===================================================================


top_panel.create = function(s)

   local panel = wibox({
      screen = s,
      position = "top",
      ontop = false,
      visible = true,
      height = beautiful.top_panel_height,
      width = s.geometry.width,
      bg = "#00000000",
      type = "dock",
   })

   panel:struts({
      top = beautiful.top_panel_height
   })

   panel:setup {
      expand = "none",
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.align.horizontal,
        wibox.layout.margin(require("widgets.layout-box"), dpi(1), dpi(3), dpi(5), dpi(2)),
        wibox.layout.margin(tag_list.create(s), dpi(25), dpi(5), dpi(5), dpi(5)),
      },
      {
          layout = wibox.container.place,
          require('widgets.playerctl').create()
      },
      {
         layout = wibox.layout.fixed.horizontal,
         wibox.layout.margin(require('widgets.ram')(), dpi(15), dpi(15), 0, 0),
         require("widgets.calendar").create(s),
         wibox.layout.margin(wibox.widget.systray(), dpi(15), dpi(1), dpi(1), dpi(1)),
      }
   }

   local panel_bg = wibox({
      screen = s,
      position = "top",
      ontop = false,
      height = beautiful.top_panel_height,
      width = s.geometry.width,
      bg = beautiful.bg_dark,
      visible = false
   })


   -- ===================================================================
   -- Functionality
   -- ===================================================================


   -- hide panel when client is fullscreen
   local function change_panel_visibility(client)
      if client.screen == s then
         panel.ontop = not client.fullscreen
      end
   end

   -- connect panel visibility function to relevant signals
   client.connect_signal("property::fullscreen", change_panel_visibility)
   client.connect_signal("focus", change_panel_visibility)

   -- maximize panel if client is maximized
   local function toggle_maximize_top_panel(is_maximized)
      if s == awful.screen.focused() then
         if is_maximized then
            panel_bg.visible = true
         else
            panel_bg.visible = false
         end
      end
   end

   -- maximize if a client is maximized
   client.connect_signal("property::maximized", function(c)
      toggle_maximize_top_panel(c.maximized)
   end)

   client.connect_signal("manage", function(c)
      if awful.tag.getproperty(c.first_tag, "layout") == awful.layout.suit.max then
         toggle_maximize_top_panel(true)
      end
   end)

   -- unmaximize if a client is removed and there are no maximized clients left
   client.connect_signal("unmanage", function(c)
      local t = awful.screen.focused().selected_tag
      -- if client was maximized
      if c.maximized then
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               return
            end
         end
         toggle_maximize_top_panel(false)

      -- if tag was maximized
      elseif awful.tag.getproperty(t, "layout") == awful.layout.suit.max then
         -- check if any clients are open (and therefore maximized)
         for _ in pairs(t:clients()) do
            return
         end
         toggle_maximize_top_panel(false)
      end
   end)

   -- maximize if layout is maximized and a client is in the layout
   tag.connect_signal("property::layout", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_top_panel(true)
            return
         end
         toggle_maximize_top_panel(false)
      else
         toggle_maximize_top_panel(false)
      end
   end)

   -- maximize if a tag is swapped to with a maximized client
   tag.connect_signal("property::selected", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_top_panel(true)
            return
         end
         toggle_maximize_top_panel(false)
      else
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               toggle_maximize_top_panel(true)
               return
            end
         end
         toggle_maximize_top_panel(false)
      end
   end)
-- hide panel when client is fullscreen
   local function change_panel_visibility(client)
       	client.border_color = beautiful.border_focus or "#fa02bb"
      if client.screen == s then
         panel.ontop = not client.fullscreen
      end
   end

   -- connect panel visibility function to relevant signals
   client.connect_signal("property::fullscreen", change_panel_visibility)
   client.connect_signal("focus", change_panel_visibility)

   -- maximize panel if client is maximized
   local function toggle_maximize_bottom_panel(is_maximized)
      if s == awful.screen.focused() then
         if is_maximized then
            panel.shape = maximized_panel_shape
         else
            panel.shape = panel_shape
         end
      end
   end

   client.connect_signal('unfocus', function(c) 
       	c.border_color = beautiful.border_normal or "#ababab"
   end)

   -- maximize if a client is maximized
   client.connect_signal("property::maximized", function(c)
      toggle_maximize_bottom_panel(c.maximized)
   end)

   client.connect_signal("manage", function(c)
       c.shape = utils.rounded_rect()
       if awful.tag.getproperty(c.first_tag, "layout") == awful.layout.suit.max then
           toggle_maximize_bottom_panel(true)
       end
   end)

   -- unmaximize if a client is removed and there are no maximized clients left
   client.connect_signal("unmanage", function(c)
      local t = awful.screen.focused().selected_tag
      -- if client was maximized
      if c.maximized then
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               return
            end
         end
         toggle_maximize_bottom_panel(false)

      -- if tag was maximized
      elseif awful.tag.getproperty(t, "layout") == awful.layout.suit.max then
         -- check if any clients are open (and therefore maximized)
         for _ in pairs(t:clients()) do
            return
         end
         toggle_maximize_bottom_panel(false)
      end
   end)

   -- maximize if layout is maximized and a client is in the layout
   tag.connect_signal("property::layout", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_bottom_panel(true)
            return
         end
         toggle_maximize_bottom_panel(false)
      else
         toggle_maximize_bottom_panel(false)
      end
   end)

   -- maximize if a tag is swapped to with a maximized client
   tag.connect_signal("property::selected", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_bottom_panel(true)
            return
         end
         toggle_maximize_bottom_panel(false)
      else
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               toggle_maximize_bottom_panel(true)
               return
            end
         end
         toggle_maximize_bottom_panel(false)
      end
   end)


end

return top_panel
