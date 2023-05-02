-- [[ plug.lua ]]

return require('packer').startup(function(use)
    -- add packer to remove the warning
    use 'wbthomason/packer.nvim'
    -- tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'mhinz/vim-startify' -- start screen
    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- [[ Tree Sitter ]]
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    -- [[ Color Theme ]]
    use "ellisonleao/gruvbox.nvim"
end)
