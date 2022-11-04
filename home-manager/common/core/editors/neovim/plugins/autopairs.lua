local ap = require 'nvim-autopairs'
local cmp = require 'cmp'

ap.setup {}
cmp.setup {
    map_complete = false,
    map_cr = true,
    auto_select = true,
}
