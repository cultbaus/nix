local snip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            snip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm { select = false },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'neorg' },
    },
}
