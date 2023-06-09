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
vim.keymap.set('n', L..'n', function() vim.cmd('NvimTreeToggl') end)
-- Clear Search
vim.keymap.set('n', L..'cs', function() vim.cmd('nohlsearch') end)
