#!/usr/bin/lua
-- Get current memory usage
-- Extracted from my awesome wm config (because poybar's one wasn't as precise)
local floor = math.floor

local mem_now = {}

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

local res =  mem_now.used .. " MB"
print(res)
