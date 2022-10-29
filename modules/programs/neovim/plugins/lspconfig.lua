local lspconfig = require 'lspconfig'
local cmp = require 'cmp_nvim_lsp'

local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr) end

lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
        vim.o.list = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = { 'gopls', 'serve' },
    settings = {
        gopls = {
            analyses = {
                unreachable = true,
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end,
    root_dir = require('lspconfig').util.root_pattern '.git/',
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.stdpath 'config' .. '/lua'] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.bashls.setup {
    capabilities = capabilities,
    on_attach = function(client)
        on_attach(client)
    end,
}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client)
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end
        on_attach(client)
    end,
}

lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        on_attach(client)
    end,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importMergeBehavior = 'last',
                importPrefix = 'by_self',
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
}

lspconfig.rnix.setup {
    capabilities = capabilities,
    on_attach = function(client)
        on_attach(client)
    end,
}
