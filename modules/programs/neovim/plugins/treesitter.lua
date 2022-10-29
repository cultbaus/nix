local ts = require 'nvim-treesitter.configs'

ts.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
}
