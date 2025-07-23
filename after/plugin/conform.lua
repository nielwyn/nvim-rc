require('conform').setup {
	formatters_by_ft = {
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "isort", "black", stop_after_first = true },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	notify_on_error = false,     -- Reduce UI interruptions
	notify_no_formatters = false, -- Silence if no formatter
	formatters = {
		shfmt = { prepend_args = { "-i", "2" } },
	},
}
