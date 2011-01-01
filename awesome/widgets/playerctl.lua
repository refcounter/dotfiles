local wibox = require("wibox")
local beautiful = require("beautiful")
local utils = require("components.ui")
local watch = require("awful.widget.watch")
local awful = require("awful")

local opts = {
    timeout = 5,
}

local playerctl = {}

--Callbacks and helpers to get player metadata
-- Lua async sucks :(
--local cmd_get_format = 'playerctl metadata --format "{{artist}} - {{title}}"'
local cmd_get_format = 'mpc -p 6670 -f "%artist% - %title%"'
local cmd_get_thumb = 'playerctl metadata mpris:artUrl'

local get_format_cb = function(cb)
    awful.spawn.easy_async(cmd_get_format, function(out)
        cb(out)
    end)
end

local get_thumb_cb = function(cb)
    awful.spawn.easy_async(cmd_get_thumb, function(out)
        cb(thumb)
    end)
end

playerctl.create = function()
    local song_text = wibox.widget({
        id = "song_text",
		font = beautiful.font,
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
        markup = utils.colorize_text("  ▶️ ", beautiful.mpc_color or beautiful.fg_normal)
    })

    local text = wibox.container.background(song_text)

    widget = wibox.widget({
        text,
        spacing = beautiful.spacing,
        layout = wibox.layout.fixed.horizontal,
    })

    watch('acpi -i', opts.timeout, function(_, _)
        get_format_cb(function(f)
            song_text.markup = utils.colorize_text("▶️ ".. f, beautiful.mpc_color or 
            beautiful.fg_normal)
        end)
    end)

	return widget
end

return playerctl
