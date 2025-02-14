local gitsigns = require('gitsigns')

gitsigns.setup {
	signs = {
		add          = { text = '+' },
		change       = { text = '~' },
		delete       = { text = '-' },
		topdelete    = { text = 'X' },
		changedelete = { text = '±' },
		untracked    = { text = '?' },
	},
	signs_staged = {
		add          = { text = '+' },
		change       = { text = '~' },
		delete       = { text = '-' },
		topdelete    = { text = 'X' },
		changedelete = { text = '±' },
		untracked    = { text = '?' },
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		delay = 0,
	},
	on_attach = function()
		vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk_inline)
	end
}
