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
    local settingsPath = '.config/nvim'
    local cwdPath = vim.fn.getcwd():sub(- #settingsPath)
    if cwdPath == settingsPath then -- close settings
        vim.cmd('tabclose')
    else                            -- open settings
        vim.cmd('tabnew ~/' .. settingsPath)
        vim.cmd('cd ~/' .. settingsPath)
    end
end)
