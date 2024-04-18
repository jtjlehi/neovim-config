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
    -- [[ Tree Sitter ]]
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use { "HiPhish/rainbow-delimiters.nvim" }
    -- [[ Color Theme/Stylying ]]
    use "ellisonleao/gruvbox.nvim"
    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use { "lukas-reineke/indent-blankline.nvim", main = "ibl" }
    -- [[ Git ]]
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    -- [[ LSP ]]
    use "lukas-reineke/lsp-format.nvim"
    use 'neovim/nvim-lspconfig'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use 'simrat39/rust-tools.nvim'
    use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }
    use {
        'mrcjkb/haskell-tools.nvim',
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    }
    -- [[ Autocompletion ]]
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- [[Toggle Term]]
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end
    }
    -- [[Telescope]]
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    -- [[Markdown]]
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
