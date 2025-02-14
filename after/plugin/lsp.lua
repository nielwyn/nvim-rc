require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require("mason-lspconfig").setup({
	ensure_installed = {
		'clangd',
		'cmake',
		'vimls',
		'lua_ls',
		'html',
		'htmx',
		'remark_ls',
		'cssls',
		'ts_ls',
		'jsonls',
		'ast_grep',
	}
})

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities())

-- This is where to enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})

require('lspconfig').clangd.setup({})
require('lspconfig').cmake.setup({})
require('lspconfig').vimls.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').remark_lss.setup({})
require('lspconfig').cssls.setup({})
require('lspconfig').ts_ls.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').ast_grep.setup({})

local cmp = require('cmp')
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' }
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body) -- Need Neovim v0.10 to use vim.snippet
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Simple tab complete
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'select' })
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),
		-- Go to previous item
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	completion = {
		preselect = 'item',
		completeopt = 'menu,menuone,noinsert'
	},
})

vim.diagnostic.config({
	signs = false,
})
