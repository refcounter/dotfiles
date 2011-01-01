
local M = {}

M.on_attach = function (_, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>co', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help )
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition )
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end )
end

return M
