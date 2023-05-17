--[[ opts.lua ]]
-- [[ Context ]]
vim.o.colorcolumn = '80'    -- str:  Show col for max line length
vim.o.number = true         -- bool: Show line numbers
vim.o.relativenumber = true -- bool: Show relative line numbers
vim.o.scrolloff = 4         -- int:  Min num lines of context
vim.o.signcolumn = "yes"    -- str:  Show the sign column

-- [[ Filetypes ]]
vim.o.encoding = 'utf8'     -- str:  String encoding to use
vim.o.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
vim.o.termguicolors = true       -- bool: If term supports ui color then enable
vim.cmd([[colorscheme gruvbox]]) -- cmd:  set the color scheme

-- [[ Search ]]
vim.o.ignorecase = true -- bool: Ignore case in search patterns
vim.o.smartcase = true  -- bool: Override ignorecase if search contains capitals
vim.o.incsearch = true  -- bool: Use incremental search

-- [[ Whitespace ]]
vim.o.expandtab = true -- bool: Use spaces instead of tabs
vim.o.shiftwidth = 4   -- num:  Size of an indent
vim.o.softtabstop = 4  -- num:  Number of spaces tabs count for in insert mode
vim.o.tabstop = 4      -- num:  Number of spaces tabs count for
vim.o.list = true
vim.opt.listchars:append "tab:<->"
vim.opt.listchars:append "space:•"

-- [[ Splits ]]
vim.o.splitright = true -- bool: Place new window to right of current one
vim.o.splitbelow = true -- bool: Place new window below the current one

-- [[ Folding ]]
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 2
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`.
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()
