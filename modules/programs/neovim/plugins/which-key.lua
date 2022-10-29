local wk = require 'which-key'

local b = require 'telescope.builtin'

local function find_files()
    if os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1' == 0 then
        b.git_files {}
    else
        b.find_files { previewer = false }
    end
end

local function live_grep()
    b.live_grep { previwer = false }
end

local function diagnostics()
    b.diagnostics()
end

wk.register {
    ['<C-p>'] = { find_files, 'find file' },
    ['<C-g>'] = { live_grep, 'live grep' },

    f = {
        ae = { diagnostics, 'view all errors' },
        ne = { vim.diagnostic.goto_next, 'go to next error' },
        pe = { vim.diagnostic.goto_prev, 'go to prev error' },
    },
    g = {
        d = { vim.lsp.buf.definition, 'go to definition' },
        r = { vim.lsp.buf.references, 'go to references' },
    },
    K = { vim.lsp.buf.hover, 'hover' },
    qf = { vim.lsp.buf.code_action, 'quickfix / code action' },

    ['<leader>'] = {
        ['rn'] = { vim.lsp.buf.rename, 'rename' },
        w = { '<cmd>Neorg workspace work<CR>', 'jump to workspace for neorg work directory' },
        p = { '<cmd>Neorg workspace home<CR>', 'jump to workspace for neorg personal directory' },
    },
}
