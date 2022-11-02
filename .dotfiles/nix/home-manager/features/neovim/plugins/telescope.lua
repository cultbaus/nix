local telescope = require 'telescope'
local b = require 'telescope.builtin'
local a = require 'telescope.actions'

telescope.setup {
    layout_strategy = 'horizontal',
    use_less = false,
    file_ignore_patterns = {
        '%.jpg',
        '%.jpeg',
        '%.png',
        '%.otf',
        '%.ttf',
        '%.sum',
        'node_modules',
        '.git',
    },
    mappings = {
        i = {
            ['<Esc>'] = a.close,
            ['<C-k>'] = a.move_selection_previous,
            ['<C-j>'] = a.move_selection_next,
        },
    },
}
