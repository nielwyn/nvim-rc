local cp = require("catppuccin.palettes").get_palette()

vim.cmd [[colorscheme catppuccin-mocha ]]

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = cp.overlay0, bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })

vim.api.nvim_set_hl(0, 'GitSignsAdd',         { fg = cp.green,    bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange',      { fg = cp.yellow,   bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete',      { fg = cp.red,      bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsTopDelete',   { fg = cp.maroon,   bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChangeDelete',{ fg = cp.peach,    bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsUntracked',   { fg = cp.blue,     bg = 'NONE' })

vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'MiniCursorword',        { fg = cp.yellow })
