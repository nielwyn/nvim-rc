local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},
	opts = {
		-- Define formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>bf", function()
	require("conform").format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code" })
