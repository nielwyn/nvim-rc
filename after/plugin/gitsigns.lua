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
		vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
	end,

	-- Navigation
	vim.keymap.set('n', ']c', function()
		if vim.wo.diff then
			vim.cmd.normal({ ']c', bang = true })
		else
			gitsigns.nav_hunk('next')
		end
	end),

	vim.keymap.set('n', '[c', function()
		if vim.wo.diff then
			vim.cmd.normal({ '[c', bang = true })
		else
			gitsigns.nav_hunk('prev')
		end
	end),

	-- Actions
	vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk),
	vim.keymap.set('v', '<leader>hr', function()
		gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end)
}
