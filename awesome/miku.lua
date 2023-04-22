-- Initialization
-- ===================================================================

local awful = require("awful")
local gears = require("gears")
local beautiful = require('beautiful')

local miku = {}


-- ===================================================================
-- miku setup
-- ===================================================================


miku.initialize = function()
   -- Set Wallpaper
   gears.wallpaper.maximized(gears.filesystem.get_configuration_dir() .. "/wallpaper/miku.png")

   -- Import components
   require("components.exit-screen")
   require("components.volume-adjust")
   --require("components.miku.titlebar")

   screen.connect_signal('arrange', function(s)
       local only_one = #s.tiled_clients == 1

       for _, c in pairs(s.clients) do
           if only_one and not c.floating or c.maximized then
               c.border_width = 0
           else
               c.border_width = beautiful.border_width or dpi(10)-- your border width
           end
       end
   end)

   -- Import panels
   local top_panel = require("components.miku.top-panel")

   -- Set up each screen (add tags & panels)
   awful.screen.connect_for_each_screen(function(s)
      for i = 1, 7, 1
      do
         awful.tag.add(i, {
            --icon = icon_dir .. i .. ".png",
            icon_only = false,
            layout = awful.layout.suit.tile,
            screen = s,
            selected = i == 1
         })
      end

      -- Only add the left panel on the primary screen
      if s.index == 1 then
         --bottom_panel.create(s)
      end

      -- Add the top panel to every screen
      top_panel.create(s)
   end)

   -- set initally selected tag to be active
   local initial_tag = awful.screen.focused().selected_tag
end

return miku
