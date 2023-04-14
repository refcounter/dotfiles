
local themes = {"kanagawa", "tokyonight", "github_dark", 'tokyonight-night', 'tokyonight-day'}
local selected_index = 4

require('tokyonight').setup({
  transparent = true,
})

vim.cmd("colorscheme "..themes[selected_index])


