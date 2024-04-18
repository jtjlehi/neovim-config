-- start lsp zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps(opts)
    if client.supports_method('textDocument/formatting') then
        require "lsp-format".on_attach(client)
    end
    -- key bindings
    vim.keymap.set({ 'n', 'v' }, '<Leader>c', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>r', vim.lsp.buf.rename)
end)
-- folding
lsp.set_server_config({
    capabilities = {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
        }
    }
})

--------------------------------------------------------------------------------
-- Configure/Install Servers
--------------------------------------------------------------------------------
local lspconfig = require 'lspconfig'

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- rust_analyzer
local rt = require("rust-tools")
rt.setup({
    tools = {
        inlay_hints = { only_current_line = true }
    },
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                    extraArgs = { "--all", "--", "-D", "clippy::all" },
                },
            },
        },
    },
})

-- metals for scala

local metals_config = require("metals").bare_config()

metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})

-- haskell-tools

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    callback = function()
        local ht = require('haskell-tools')
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { noremap = true, silent = true, buffer = bufnr, }
        -- haskell-language-server relies heavily on codeLenses,
        -- so auto-refresh (see advanced configuration) is enabled by default
        vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
        -- Hoogle search for the type signature of the definition under the cursor
        vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
        -- Evaluate all code snippets
        vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
        -- Toggle a GHCi repl for the current package
        vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
        -- Toggle a GHCi repl for the current buffer
        vim.keymap.set('n', '<leader>rf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, opts)
        vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
    end
})

--------------------------------------------------------------------------------
-- Auto Completion
--------------------------------------------------------------------------------
local cmp = require "cmp"

cmp.setup({
    mapping = {
        -- enter to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space'] = cmp.mapping.complete(),
    }
})

-- finish setup

lsp.setup()
