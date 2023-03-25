-- Must set settings before any imports to coq
vim.g.coq_settings = { keymap = { recommended = false }, auto_start = true }

local M = {}

M.lsp = require('plugins.lsp')
M.lualine = require('plugins.lualine_config')
M.telescope = require('plugins.telescope_config')
M.npairs = require('plugins.npairs')

M.glow = require('glow').setup {}
M.jabs = require 'jabs'.setup {}
M.aerial = require('plugins.aerial')

return M
