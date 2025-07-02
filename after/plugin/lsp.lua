-- Optimize LSP capabilities for speed
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Disable unused capabilities for speed
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" }
}

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

vim.lsp.config('ts_ls', {
	flags = {
		debounce_text_changes = 100,
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "none",
				includeInlayFunctionParameterTypeHints = false,
			},
		},
	},
})
-- Use ONLY OmniSharp for C#
vim.lsp.config('omnisharp', {
	cmd = {
		"omnisharp",
		"--languageserver",
		"--hostPID", tostring(vim.fn.getpid())
	},
	root_dir = require('lspconfig.util').root_pattern("*.sln", "*.csproj"),
	filetypes = { "cs" },
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = true,
			OrganizeImports = true,
		},
		MsBuild = {
			LoadProjectsOnDemand = false,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = true,
			AnalyzeOpenDocumentsOnly = false,
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
	virtual_text = {
		prefix = '▎',
		spacing = 4,
		severity = vim.diagnostic.severity.ERROR,
		update_in_insert = false
	},
	severity_sort = true,
})

vim.lsp.set_log_level("WARN")
