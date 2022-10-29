local g = vim.g
local o = vim.opt

g.mapleader = '\\'

-- Completion
o.completeopt = 'menu,menuone,noselect'
o.shortmess = 'flmTWAIq'

-- Search
o.hlsearch = true

-- Indents
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.expandtab = true

-- Status line
o.ruler = true
o.showmode = false
o.laststatus = 2

-- Better display
o.signcolumn = 'number'
o.cmdheight = 1
o.pumheight = 10
o.splitbelow = true
o.hidden = true

-- File types
o.encoding = 'utf8'
o.ffs = 'unix,dos,mac'

-- Hover update debouncer
o.updatetime = 300

-- File changes
o.autowrite = true
o.autowriteall = true
o.autoread = true
o.backup = false
o.writebackup = false
o.swapfile = false

-- Memory
o.maxmempattern = 2000000

-- List characters
o.list = true
o.listchars = string.format 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'
o.fillchars = vim.o.fillchars .. string.format 'vert: ,eob: '

-- System clipboard
o.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Misc
o.wrap = false
o.number = true

-- Disable providers
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Colors
o.termguicolors = true

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

-- Normal mode
utils.inoremap('jk', '<ESC>')

-- Terminal mode escapes
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('jk', [[<C-\><C-n>]])

-- Escape
utils.nnoremap('q:', ':q')

local fn = vim.fn

local modes = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL LINE',
    [''] = 'VISUAL BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'SELECT LINE',
    [''] = 'SELECT BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'VISUAL REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MOAR',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
}

local function mode()
    local current_mode = api.nvim_get_mode().mode
    return string.format(' %s ', modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = api.nvim_get_mode().mode
    local mode_color = '%#StatusLineAccent#'
    if current_mode == 'n' then
        mode_color = '%#StatuslineAccent#'
    elseif current_mode == 'i' or current_mode == 'ic' then
        mode_color = '%#StatuslineInsertAccent#'
    elseif current_mode == 'v' or current_mode == 'V' or current_mode == '' then
        mode_color = '%#StatuslineVisualAccent#'
    elseif current_mode == 'R' then
        mode_color = '%#StatuslineReplaceAccent#'
    elseif current_mode == 'c' then
        mode_color = '%#StatuslineCmdLineAccent#'
    elseif current_mode == 't' then
        mode_color = '%#StatuslineTerminalAccent#'
    end
    return mode_color
end

local function filepath()
    local fpath = fn.fnamemodify(fn.expand '%', ':~:.:h')
    if fpath == '' or fpath == '.' then
        return ' '
    end
    return string.format(' %%<%s/', fpath)
end

local function filename()
    local fname = fn.expand '%:t'
    if fname == '' then
        return ''
    end
    return fname .. ' '
end

local function filetype()
    return string.format(' %s ', vim.bo.filetype):upper()
end

local function lineinfo()
    if vim.bo.filetype == 'alpha' then
        return ''
    end
    return ' %P %#Normal# %l:%c '
end

local function lsp()
    local count = {}
    local levels = {
        errors = 'Error',
        warnings = 'Warn',
        info = 'Info',
        hints = 'Hint',
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ''
    local warnings = ''
    local hints = ''
    local info = ''

    local error_sign = ' '
    local warning_sign = ' '
    local hint_sign = ' '
    local info_sign = ' '

    if count['errors'] ~= 0 then
        errors = ' %#LspDiagnosticsSignError#' .. error_sign .. count['errors']
    end
    if count['warnings'] ~= 0 then
        warnings = ' %#LspDiagnosticsSignWarning#' .. warning_sign .. count['warnings']
    end
    if count['hints'] ~= 0 then
        hints = ' %#LspDiagnosticsSignHint#' .. hint_sign .. count['hints']
    end
    if count['info'] ~= 0 then
        info = ' %#LspDiagnosticsSignInformation#' .. info_sign .. count['info']
    end

    return errors .. warnings .. hints .. info .. '%#Normal#'
end

Statusline = {}

Statusline.active = function()
    return table.concat {
        '%#Statusline#',
        update_mode_colors(),
        mode(),
        '%#Normal#',
        filepath(),
        filename(),
        '%#Normal#',
        lsp(),
        '%=%#StatusLineExtra#',
        filetype(),
        lineinfo(),
    }
end

function Statusline.inactive()
    return ' %F'
end

local group = vim.api.nvim_create_augroup('Statusline', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.Statusline.active()',
    group = group,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.Statusline.inactive()',
    group = group,
})

-- lmao
vim.cmd [[
augroup custom_highlight
  autocmd!
  au BufEnter * highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71
  au BufEnter * highlight StatusLineAccent guifg=#1d2021 guibg=#89b482
  au BufEnter * highlight StatusLineInsertAccent guifg=#1d2021 guibg=#ea6962
  au BufEnter * highlight StatusLineVisualAccent guifg=#1d2021 guibg=#a9b665
  au BufEnter * highlight StatusLineReplaceAccent guifg=#1d2021 guibg=#ea6962
  au BufEnter * highlight StatusLineCmdLineAccent guifg=#1d2021 guibg=#d8a657
  au BufEnter * highlight StatuslineTerminalAccent guifg=#1d2021 guibg=#d8a657
  au BufEnter * highlight StatusLineExtra guifg=#a89984
  au BufEnter * highlight StatusLineNC guibg=NONE
  au BufEnter * highlight CursorLineNr guibg=#282828

  au BufEnter * highlight NormalFloat guibg=#1d2021
  au BufEnter * highlight TelescopeSelection guibg=#282828 guifg=#89b482 gui=bold
  au BufEnter * highlight NvimTreeFolderIcon guifg=#7daea3
  au BufEnter * highlight NvimTreeFolderName guifg=#7daea3
  au BufEnter * highlight FloatBorder guifg=#89b482
  au BufEnter * highlight TabLineSel guibg=#282828 guifg=#ddc7a1
  au BufEnter * highlight TabLineNorm guibg=#1d2021 guifg=#a89984
  au BufEnter * highlight TabLineFill guibg=#1d2021
  au BufEnter * highlight TSKeywordFunction gui=italic guifg=#ea6962
  au BufEnter * highlight TSConditional gui=italic guifg=#ea6962
  au BufEnter * highlight TSRepeat gui=italic guifg=#ea6962
  au BufEnter * highlight TelescopeTitle guifg=#928374
  au BufEnter * highlight TelescopeBorder guifg=#303030
augroup END
]]
