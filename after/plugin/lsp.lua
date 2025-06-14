vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities()
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Note: Updated repository location and new API
require("mason-lspconfig").setup({
	ensure_installed = {
		'clangd', 'vimls', 'lua_ls', 'ts_ls', 'html', 'htmx', 'remark_ls', 'cssls',
		'jsonls', 'ast_grep', 'pyright', 'omnisharp'
	},
	-- New setting that automatically enables installed servers
	automatic_enable = true, -- This replaces the old setup_handlers
})

vim.lsp.config('htmx', {
	  filetypes = { "html", "htmldjango", "ejs" }, -- NOT "typescript" or "javascript"
})

-- Configure servers individually using vim.lsp.config()
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }
			local lsp = vim.lsp.buf
		vim.keymap.set('n', 'K', lsp.hover, opts)
		vim.keymap.set('n', 'gd', lsp.definition, opts)
		vim.keymap.set('n', 'gD', lsp.declaration, opts)
		vim.keymap.set('n', 'gi', lsp.implementation, opts)
		vim.keymap.set('n', 'go', lsp.type_definition, opts)
		vim.keymap.set('n', 'gr', lsp.references, opts)
		vim.keymap.set('n', 'gs', lsp.signature_help, opts)
		vim.keymap.set('n', '<F2>', lsp.rename, opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', function() lsp.format { async = true } end, opts)
		vim.keymap.set('n', '<F4>', lsp.code_action, opts)
	end,
})

vim.diagnostic.config({
	signs = false,
})
