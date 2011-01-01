-- Initialization
-- ===================================================================


local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local gears = require("gears")

local tag_list = require("widgets.tag-list")
local separator = require("widgets.horizontal-separator")
local folder = require("widgets.folder")
local utils = require("components.ui")

local home_dir = os.getenv("HOME")

-- define module table
local bottom_panel = {}


-- ===================================================================
-- Bar Creation
-- ===================================================================
WRAP_BG = function(widgets, opts)
	opts = opts or {}

	if type(widgets) == "table" then
		widgets.spacing = dpi(8)
	end

	return wibox.widget({
		{
			widgets,
			left = dpi(5),
			right = dpi(5),
			top = dpi(2),
			bottom = dpi(1),
			widget = wibox.container.margin,
		},
        shape = utils.rounded_rect(20),
		bg = opts.bg or beautiful.bg_main,
		widget = wibox.container.background,
	})
end


bottom_panel.create = function(s)

   local panel_shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, false, true, true, false, 40)
   end
   local maximized_panel_shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
   end

   panel = awful.wibar({
      screen = s,
      position = "bottom",
      height = dpi(25),
      width = s.geometry.width,
      ontop = true,
      visible = true,
      bg = "#00000f1",
      type = 'dock',
   })

   panel:struts({
      bottom = dpi(5),
  })

   panel:setup {
      expand = "none",
      layout = wibox.layout.align.horizontal,

      require("widgets.calendar").create(s),
      {
         layout = wibox.layout.fixed.horizontal,
         wibox.layout.margin(tag_list.create(s), dpi(5), dpi(5), 0, 0)
         --wrap_bg(tag_list.create(s), dpi(5), dpi(5), 0, 0)
      },
      wibox.layout.margin(require("widgets.layout-box"), dpi(13), dpi(3), dpi(3), dpi(3)),
   }

  
   -- ===================================================================
   -- Functionality
   -- ===================================================================


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

return bottom_panel
