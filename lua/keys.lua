--[[ keys.lua]]
local L = [[<Leader>]]

-------------------------------------------------------------------------------
-- INSERT MODE
-------------------------------------------------------------------------------

-- remap the key used to leave insert mode
vim.keymap.set('i', 'jj', '<Esc>')

-------------------------------------------------------------------------------
-- NORMAL MODE
-------------------------------------------------------------------------------

-- Toggle nvim-tree
vim.keymap.set('n', L .. 'n', function() vim.cmd('NvimTreeToggl') end)
-- Clear Search
vim.keymap.set('n', L .. 'cs', function() vim.cmd('nohlsearch') end)
-- Open terminal
vim.keymap.set('n', L .. 't', function() vim.cmd('term') end)
-- show errors
vim.keymap.set('n', L .. 'e', vim.diagnostic.open_float)
-- Toggle Settings
vim.keymap.set('n', L .. L, function()
    vim.cmd('tabnew ~/.config/nvim')
    vim.cmd('cd ~/.config/nvim')
end)
