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
    callback = function() require("metals").initialize_or_attach({}) end,
    group = nvim_metals_group,
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
