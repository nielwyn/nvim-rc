-- basic options
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 9
vim.opt.updatetime = 50
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

-- status column format
vim.o.statuscolumn = " %s%l %=%r "

vim.o.breakindent = true
