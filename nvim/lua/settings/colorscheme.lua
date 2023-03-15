
local themes = {"kanagawa", "tokyonight", "github_dark"}
local selected_index = 1
local selected_theme = require(themes[1])


vim.cmd("colorscheme "..themes[selected_index])
require('transparent').setup({
  enable = true
})
