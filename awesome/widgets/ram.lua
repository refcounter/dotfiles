local wibox = require("wibox")
local beautiful = require("beautiful")
local utils = require("components.ui")
local watch = require("awful.widget.watch")
local floor = math.floor

return function()
    local cpu = wibox.widget({
		id = "cpu",
		font = beautiful.font,
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
        markup = utils.colorize_text("MEM: ", beautiful.mpc_color or beautiful.fg_normal),
})

local mem_text = wibox.widget({
    widget = wibox.widget.textbox,
    id = "mem_text",
    text = "RAM: ",
    align = "center",
    valign = "center",
    font = beautiful.font,
})
local text = wibox.container.background(mem_text)

local opts = {timeout = 1}

widget = wibox.widget({
    text,
    spacing = beautiful.spacing,
    layout = wibox.layout.fixed.horizontal,
})


	watch('acpi -i', opts.timeout, function(_, stdout)
        mem_now = {}
        for line in io.lines('/proc/meminfo') do
            for k, v in string.gmatch(line, "([%a]+):[%s]+([%d]+).+") do
                if     k == "MemTotal"     then mem_now.total = floor(v / 1024 + 0.5)
                elseif k == "MemFree"      then mem_now.free  = floor(v / 1024 + 0.5)
                elseif k == "Buffers"      then mem_now.buf   = floor(v / 1024 + 0.5)
                elseif k == "Cached"       then mem_now.cache = floor(v / 1024 + 0.5)
                elseif k == "SwapTotal"    then mem_now.swap  = floor(v / 1024 + 0.5)
                elseif k == "SwapFree"     then mem_now.swapf = floor(v / 1024 + 0.5)
                elseif k == "SReclaimable" then mem_now.srec  = floor(v / 1024 + 0.5)
                end
            end
        end

        mem_now.used = mem_now.total - mem_now.free - mem_now.buf - mem_now.cache - mem_now.srec
        mem_now.swapused = mem_now.swap - mem_now.swapf
        mem_now.perc = math.floor(mem_now.used / mem_now.total * 100)

        mem_text.text = "RAM: " .. mem_now.used .." MB"
        --mem_text.markup = utils.colorize_text("MEM: ".. mem_now.used .. " MB", beautiful.mpc_color)

        if mem_now.used > 3048 then
            mem_text.fg = beautiful.fg_normal
        else 
            mem_text.fg = beautiful.mpc_color
        end

        current_text = mem_now.used

    end)
	return widget
end
