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
    -- [[ Git ]]
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    -- [[ LSP ]]
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                run = function ()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    -- [[ Autocompletion ]]
    use 'm4xshen/autoclose.nvim'
end)
