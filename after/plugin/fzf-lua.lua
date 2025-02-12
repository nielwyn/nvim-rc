require('fzf-lua').setup({
	winopts = {
		height = 0.9,
		width = 0.9,
		preview = {
			layout = "vertical",
		}
	},
	files = {
		formatter = "path.filename_first", -- places file name first
	},

})

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'fzf `find` or `fd` on a path' })
vim.keymap.set('n', '<leader>fg', fzf.grep, { desc = 'fzf search with grep or rg pattern' })
vim.keymap.set('n', '<leader>fc', fzf.grep_cword, { desc = 'fzf search word under cursor' })
vim.keymap.set('n', '<leader>fb', fzf.lgrep_curbuf, { desc = 'fzf live grep current buffer' })
vim.keymap.set('n', '<leader>fl', fzf.live_grep_glob, { desc = 'fzf live grep with rg --glob support' })
