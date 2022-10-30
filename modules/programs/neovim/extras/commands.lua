local diagnostic_hover = vim.api.nvim_create_augroup('HoverDiagnostics', { clear = true })

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
}

vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    pattern = { '<buffer>' },
    command = 'silent! lua vim.diagnostic.open_float({ focusable = false, focus = false })',
    group = diagnostic_hover,
})

-- Colors
vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

-- 200 WPM config
vim.cmd 'command! -nargs=* W w'
vim.cmd 'command! -nargs=* Wq wq'
vim.cmd 'command! -nargs=* Q q'
