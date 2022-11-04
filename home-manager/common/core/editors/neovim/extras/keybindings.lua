local api = vim.api
local fmt = string.format

_G.utils = {
    _functions = {},
}

function utils.create(f)
    table.insert(utils._functions, f)
    return #utils._functions
end

function utils.execute(id, args)
    utils._functions[id](args)
end

local map = function(mode, key, cmd, opts, defaults)
    opts = vim.tbl_deep_extend('force', { silent = true }, defaults or {}, opts or {})

    if type(cmd) == 'function' then
        local fn_id = utils.create(cmd)
        cmd = fmt('<CMD>lua utils.execute(%s)<CR>', fn_id)
    end

    if opts.buffer ~= nil then
        local buffer = opts.buffer
        opts.buffer = nil
        return api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
    else
        return api.nvim_set_keymap(mode, key, cmd, opts)
    end
end

function utils.map(mode, key, cmd, opt, defaults)
    return map(mode, key, cmd, opt, defaults)
end

function utils.nmap(key, cmd, opts)
    return map('n', key, cmd, opts)
end

function utils.vmap(key, cmd, opts)
    return map('v', key, cmd, opts)
end

function utils.xmap(key, cmd, opts)
    return map('x', key, cmd, opts)
end

function utils.imap(key, cmd, opts)
    return map('i', key, cmd, opts)
end

function utils.omap(key, cmd, opts)
    return map('o', key, cmd, opts)
end

function utils.smap(key, cmd, opts)
    return map('s', key, cmd, opts)
end

function utils.nnoremap(key, cmd, opts)
    return map('n', key, cmd, opts, { noremap = true })
end

function utils.vnoremap(key, cmd, opts)
    return map('v', key, cmd, opts, { noremap = true })
end

function utils.xnoremap(key, cmd, opts)
    return map('x', key, cmd, opts, { noremap = true })
end

function utils.inoremap(key, cmd, opts)
    return map('i', key, cmd, opts, { noremap = true })
end

function utils.tnoremap(key, cmd, opts)
    return map('t', key, cmd, opts, { noremap = true })
end

function utils.onoremap(key, cmd, opts)
    return map('o', key, cmd, opts, { noremap = true })
end

function utils.snoremap(key, cmd, opts)
    return map('n', key, cmd, opts, { noremap = true, silent = true })
end

function utils.augroup(name, autocmds, noclear)
    vim.cmd('augroup ' .. name)
    if not noclear then
        vim.cmd 'autocmd!'
    end
    for _, c in ipairs(autocmds) do
        local command = c.command
        if type(command) == 'function' then
            local fn_id = utils.create(command)
            command = fmt('lua utils.execute(%s)', fn_id)
        end
        vim.cmd(
            fmt(
                'autocmd %s %s %s %s',
                table.concat(c.events, ','),
                table.concat(c.targets or {}, ','),
                table.concat(c.modifiers or {}, ' '),
                command
            )
        )
    end
    vim.cmd 'augroup END'
end

function utils.command(name, fn)
    if type(fn) == 'function' then
        local fn_id = utils.create(fn)
        fn = fmt('lua utils.execute(%s)', fn_id)
    end
    vim.cmd(fmt('command! %s %s', name, fn))
end

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

-- Normal mode
utils.inoremap('jk', '<ESC>')

-- Terminal mode escapes
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('jk', [[<C-\><C-n>]])

-- Escape
utils.nnoremap('q:', ':q')

-- Telescope
utils.nnoremap('<C-p>', find_files)
utils.nnoremap('<C-g>', live_grep)

-- Lsp
utils.nnoremap('gd', vim.lsp.buf.definition)
utils.nnoremap('gr', vim.lsp.buf.references)
utils.nnoremap('K', vim.lsp.buf.hover)
utils.nnoremap('qf', vim.lsp.buf.code_action)
utils.nnoremap('<leader>rn', vim.lsp.buf.rename)

-- Errors
utils.nnoremap('fne', vim.diagnostic.goto_next)
utils.nnoremap('fpe', vim.diagnostic.goto_prev)
utils.nnoremap('fae', diagnostics)

-- Neorg
utils.nnoremap('<leader>w', '<cmd>Neorg workspace work<CR>')
utils.nnoremap('<leader>w', '<cmd>Neorg workspace home<CR>')
