local null = require 'null-ls'

local augroup = vim.api.nvim_create_augroup('Format', {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format {
        filter = function(clients)
            return vim.tbl_filter(function(client)
                return client == 'null-ls'
            end, clients)
        end,
        bufnr = bufnr,
    }
end

local function on_attach(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local b = null.builtins

null.setup {
    on_attach = on_attach,
    diagnostics_format = '[#{c}] #{m} (#{s})',
    sources = {
        b.formatting.prettierd.with { filetypes = { 'html', 'json', 'markdown' } },
        b.formatting.eslint_d,
        b.diagnostics.eslint_d,
        b.formatting.goimports,
        b.formatting.gofmt,
        b.formatting.rustfmt,
        b.formatting.stylua,
        b.formatting.nixpkgs_fmt,
        b.formatting.shfmt.with { args = { '-i', '2', '-ci' } },
    },
}
