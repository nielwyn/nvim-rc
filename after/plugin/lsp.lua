-- Build capabilities only once and extend with cmp_nvim_lsp if available
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" }
}
-- If using nvim-cmp, further enhance capabilities
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		'ast_grep',
		'bashls',
		'clangd',
		'cssls',
		'gopls',
		'html',
		'htmx',
		'jsonls',
		'lua_ls',
		'omnisharp',
		'pyright',
		'remark_ls',
		'ts_ls',
		'vimls',
	},
	automatic_installation = true,
})

vim.lsp.config('htmx', {
	filetypes = { "html", "htmldjango", "ejs" }, -- NOT "typescript" or "javascript"
})

vim.lsp.config('ts_ls', {
	flags = {
		debounce_text_changes = 100,
	},
	settings = {
		typescript = {
			preferences = {
				exclude = { "node_modules", "out", "build", "third_party", "gen" }
			},
		},
		javascript = {
			preferences = {
				exclude = { "node_modules", "out", "build", "third_party", "gen" }
			}
		}
	},
})


local lspconfig = require('lspconfig')
lspconfig.omnisharp.setup({
	capabilities = capabilities,
	cmd = {
		vim.fn.stdpath('data') .. '/mason/packages/omnisharp/omnisharp', -- Full path
		"--languageserver",
		"--hostPID",
		tostring(vim.fn.getpid())
	},
	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = true,
			OrganizeImports = true,
		},
		MsBuild = { LoadProjectsOnDemand = false },
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = true,
			AnalyzeOpenDocumentsOnly = false,
		},
	},
})

-- LSP keymaps: use more reliable on_attach (future-proof)
local function lsp_on_attach(event)
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
end

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = lsp_on_attach,
})

-- vim.lsp.set_log_level("WARN")
