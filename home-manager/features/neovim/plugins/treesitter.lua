local ts = require 'nvim-treesitter.configs'

-- local parser_dir = '/home/nil/.config/ts-parsers'

ts.setup {
    -- parser_install_dir = parser_dir,
    highlight = {
        enable = true,
        -- use_languagetree = true,
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
}

-- vim.opt.runtimepath:append(parser_dir)
