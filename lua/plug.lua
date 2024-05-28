-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    'mhinz/vim-startify', -- start screen
    -- [[ Tree Sitter ]]
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    -- [[ Color Theme/Stylying ]]
    "ellisonleao/gruvbox.nvim",
    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
    -- [[ Git ]]
    'tpope/vim-fugitive',
    'airblade/vim-gitgutter',
    -- [[ LSP ]]
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    "lukas-reineke/lsp-format.nvim",
    'neovim/nvim-lspconfig',
    { 'neovim/nvim-lspconfig' },
    -- {
    --     'williamboman/mason.nvim',
    --     build = function()
    --         pcall(vim.cmd, 'MasonUpdate')
    --     end,
    -- },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    'simrat39/rust-tools.nvim',
    { 'scalameta/nvim-metals', dependencies = { "nvim-lua/plenary.nvim" } },
    {
        'mrcjkb/haskell-tools.nvim',
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    },
    -- [[ Autocompletion ]]
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- [[Toggle Term]]
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end
    },
    -- [[Telescope]]
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    -- [[Markdown]]
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }
})
