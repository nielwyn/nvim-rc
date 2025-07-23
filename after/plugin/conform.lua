local conform = require("conform")

conform.setup({
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
})

vim.keymap.set({ "n", "v" }, "<leader>bf", function()
	local mode = vim.api.nvim_get_mode().mode
	local range
	if mode:match("[vV]") then
		range = { vim.fn.line("v"), vim.fn.line("."), vim.fn.col("v"), vim.fn.col(".") }
	end
	require("conform").format({ async = true, range = range }, function(err)
		if not err and mode:match("[vV]") then
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
		end
	end)
end, { desc = "Format code" })
