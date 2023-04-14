local o = vim.opt

o.autoread = true -- read changes to file automatically
o.laststatus = 2 -- statusline: 0-never, 1-more than two windows, 2-always, 3-only the last

-- fix indent
o.expandtab = false -- no spaces
o.tabstop = 8 -- tab size 
o.softtabstop = 8 --tab size 2
o.shiftwidth = 8 --tab size for autoindent
o.shiftround = true -- round tabs to shiftwidth
