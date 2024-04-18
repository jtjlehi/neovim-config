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
require "plug"
require "nvim-tree".setup()
require "lualine".setup {
    options = {
        theme = "auto",
    },
    sections = {
        lualine_c = {},
        lualine_x = { 'filetype' },
        lualine_y = {},
    },
    winbar = {
        lualine_a = { { 'filename', path = 1 } },
        lualine_z = { 'location' },
    },
    inactive_winbar = {
        lualine_a = { { 'filename', path = 1 } },
        lualine_z = { 'location' },
    },
}
-- Treesitter
require "nvim-treesitter.configs".setup {
    auto_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.kxi = {
    install_info = {
        url = "~/Projects/tree-sitter-kxi", -- local path or git repo
        files = { "src/parser.c" },         -- note that some parsers also require src/scanner.c or src/scanner.cc
    },
    filetype = "kxi",                       -- if filetype does not match the parser name
}

-- auto close
local npairs = require "nvim-autopairs"

npairs.setup {
    check_ts = true,
}


require "lsp" -- imported from local config file
require "ibl".setup {}
require "Comment".setup()

require("toggleterm").setup {
    open_mapping = [[<c-/>]],
    direction = 'horizontal'
}

-------------------------------------------------------------------------------
-- IMPORTS
-------------------------------------------------------------------------------

require "cmds" -- Cmd
require "opts" -- Options
require "keys" -- Keymaps
