require('kanagawa').setup({
	compile = false,             -- enable compiling the colorscheme
	undercurl = true,            -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true},
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,         -- do not set background color
	dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
	terminalColors = true,       -- define vim.g.terminal_color_{0,17}
	colors = {                   -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave",              -- Load "dragon" theme when 'background' option is not set
	background = {               -- map the value of 'background' option to a theme
		dark = "wave",           -- try "dragon" !
		light = "lotus"
	},
})

-- Setup must be called before loading
vim.cmd("colorscheme kanagawa")

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#AAAAAA', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#FB508F', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#AAAAAA' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg='NONE'})

-- Set GitSigns symbol colors
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#A3D99B', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#FFD54F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#EF5350', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsTopDelete', { fg = '#D32F2F', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChangeDelete', { fg = '#FFAB91', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#64B5F6', bg = 'NONE' })
