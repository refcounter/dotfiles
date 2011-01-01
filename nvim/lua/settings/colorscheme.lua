local kanagawa = require("kanagawa")
local c = require("kanagawa.colors").setup()

local theme = {"kanagawa", "tokyonight"}

kanagawa.setup({
   theme = "light"
})

local tn = require('tokyonight').setup({
    style = "night",
    light_style = "day",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true, italic = true },
    },
    day_brightness = 0.4,

})

vim.cmd("colorscheme ".. theme[2])
