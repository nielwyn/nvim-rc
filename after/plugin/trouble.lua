require("trouble").setup({
	icons = {
		indent = {
			middle = " ",
			last = " ",
			top = " ",
			ws = "│  ",
		},
	},
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = "auto",
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
			diagnostics = {
				groups = {
					{ "filename", format = "{file_icon} {basename:Title} {count}" },
				},
			},
		},
		-- Add a faster diagnostics mode
		diagnostics_buffer = {
			mode = "diagnostics",
			filter = { buf = 0 }, -- Only current buffer
		},
	},
	throttle = {
		refresh = 50,
		update = 10,
	},
	auto_close = true,
	auto_open = false, -- Don't auto-open, only when requested
	auto_preview = true,
	auto_fold = false,
	auto_jump = false,

	-- Limit results for better performance
	max_items = 100,

	refresh = {
		auto = true,
		delay = 50,
	},

	filter = {
		-- Only show errors and warnings by default
		severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
	},

	-- Optimize folding
	fold_open = "v",
	fold_closed = ">",
	indent_lines = false, -- Disable for better performance
})

-- Add diagnostic configuration for better performance
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- Don't update diagnostics in insert mode
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- Auto-refresh trouble when diagnostics change
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		if require("trouble").is_open() then
			require("trouble").refresh()
		end
	end,
})
