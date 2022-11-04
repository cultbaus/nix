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
