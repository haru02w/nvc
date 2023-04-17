local o = vim.opt

o.autoread = true -- read changes to file automatically
o.laststatus = 2 -- statusline: 0-never, 1-more than two windows, 2-always, 3-only the last

o.ignorecase = true -- disable case sensitiviness on search
o.smartcase = true -- enable back when a capital letter is written

o.number = true --enable numbers
o.relativenumber = true --enable relative numbers

-- fix indent
o.expandtab = false -- no spaces
o.tabstop = 8 -- tab size 
o.softtabstop = 8 --tab size 2
o.shiftwidth = 8 --tab size for autoindent
o.shiftround = true -- round tabs to shiftwidth
o.smartindent = true

o.wrap = false --don't wrap lines

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
o.undofile = true

o.hlsearch = true--keep highlights enabled (see keymaps to fast disable)
o.incsearch = true --guide the search you're doing

o.termguicolors = true -- good colors

o.scrolloff = 8 -- centralize the cursor a little

o.updatetime = 50 -- fast update time

o.colorcolumn = "80" -- good code belongs is in less than 80 lines
o.cursorline = true -- to easily track the cursor
