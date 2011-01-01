local beautiful = require("beautiful")
local gears = require("gears")

local M = {}

M.rounded_rect = function(radius)
	radius = radius or beautiful.border_radius
	return function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, radius)
	end
end

M.colorize_text = function(text, color)
	return "<span foreground='" .. color .. "'>" .. text .. "</span>"
end

return M
