--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Update packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-------------------------------------------------------------------------------
-- PLUGINS
-------------------------------------------------------------------------------

require("plug")      
require("nvim-tree").setup()
require("lualine").setup {
    options = { theme = "auto" },
    sections = {
        lualine_x = { 'filetype' },
        lualine_y = { },
    },
    tabline = { lualine_a = { "tabs" } },
    winbar = { lualine_a = { { 'buffers', mode = 4 } } },
    inactive_winbar = { lualine_a = { 'buffers' } },
}

-------------------------------------------------------------------------------
-- IMPORTS
-------------------------------------------------------------------------------

require("cmds")      -- Cmd
require("vars")      -- Variables
require("opts")      -- Options
require("keys")      -- Keymaps
