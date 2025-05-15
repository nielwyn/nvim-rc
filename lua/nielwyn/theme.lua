vim.cmd[[colorscheme tokyonight-night]]
--
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#AAAAAA', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#FAE033', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#AAAAAA' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg='NONE'})

-- Set GitSigns symbol colors
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#A3D99B', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#FFD54F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#EF5350', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsTopDelete', { fg = '#D32F2F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChangeDelete', { fg = '#FFAB91', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#64B5F6', bg = 'NONE' })

-- cursorword
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { fg="#FAE033" })
vim.api.nvim_set_hl(0, 'MiniCursorword', { fg="#FAE033" })
