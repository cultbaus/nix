local group = vim.api.nvim_create_augroup('ColorHack', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = group,
    pattern = { '*' },
    command = vim.cmd [[
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
]]   ,
})
