return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
	config = function()
		-- Disable in visual mode to avoid conflicts
		vim.g.tmux_navigator_disable_when_zoomed = 1
	end,
}
