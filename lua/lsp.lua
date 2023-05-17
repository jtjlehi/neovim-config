-- start lsp zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    if client.supports_method('textDocument/formatting') then
        require "lsp-format".on_attach(client)
    end
end)

--------------------------------------------------------------------------------
-- Configure/Install Servers
--------------------------------------------------------------------------------
local lspconfig = require 'lspconfig'

lsp.ensure_installed({
    'rust_analyzer',
    'lua-language-server',
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

--------------------------------------------------------------------------------
-- Auto Completion
--------------------------------------------------------------------------------
local cmp = require "cmp"

cmp.setup({
    mapping = {
        -- enter to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-Space'] = cmp.mapping.complete(),
    }
})

-- finish setup

lsp.setup()
