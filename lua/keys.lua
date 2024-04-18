--[[ keys.lua]]
local L = [[<Leader>]]

-------------------------------------------------------------------------------
-- INSERT MODE
-------------------------------------------------------------------------------

-- remap the key used to leave insert mode
vim.keymap.set('i', 'jj', '<Esc>')
-- insert λ
vim.keymap.set('i', '<C-l>', '<C-v>u03bb')
-- digraphs (used in insert mode by <C-k>)
local dig = function(char, number)
    vim.cmd("digr " .. char .. " " .. number)
end
dig('gr', 0x03c1) -- rho (ρ)
dig('gs', 0x03c3) -- sigma (σ)
dig('gS', 0x03a3) -- Sigma (Σ)
dig('gz', 0x03b6) -- zeta (ζ)
dig('gG', 0x0393) -- Gamma (Γ)

-------------------------------------------------------------------------------
-- NORMAL MODE
-------------------------------------------------------------------------------

-- Toggle nvim-tree
vim.keymap.set('n', L .. 'n', function() vim.cmd('NvimTreeToggl') end)
-- Clear Search
vim.keymap.set('n', L .. 'cs', function() vim.cmd('nohlsearch') end)
-- Show Errors
vim.keymap.set('n', L .. 'e', vim.diagnostic.open_float)
vim.keymap.set('n', L .. 'ge', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', L .. 'gE', function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end
)
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
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files)
vim.keymap.set('n', 'fe', builtin.diagnostics)
vim.keymap.set('n', 'fg', function()
    require('telescope').extensions.live_grep_args.live_grep_args()
end)
vim.keymap.set('n', 'fb', builtin.buffers)
vim.keymap.set('n', 'f<C-O>', builtin.jumplist)
vim.keymap.set('n', 'fd', builtin.lsp_references)
vim.keymap.set('n', 'fw', builtin.grep_string)

-------------------------------------------------------------------------------
-- NORMAL MODE
-------------------------------------------------------------------------------
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jj', [[<C-\><C-n>]])
