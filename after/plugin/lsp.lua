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
		'vimls',
		'lua_ls',
		'html',
		'htmx',
		'remark_ls',
		'cssls',
		'ts_ls',
		'jsonls',
		'ast_grep',
		'pyright',
	}
})

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities())

require('lspconfig').prettierd.setup {
  settings = {
    useTabs = true,
    tabWidth = 4,
    printWidth = 80,
  },
}

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
require('lspconfig').vimls.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').cssls.setup({})
require('lspconfig').ts_ls.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').ast_grep.setup({})
require('lspconfig').pyright.setup({})

local cmp = require('cmp')
cmp.setup({
	sources = {
		{ name = "path", priority_weight = 110 },
		{ name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
		{ name = "nvim_lua", priority_weight = 90 },
		{ name = 'buffer' },
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body) -- Need Neovim v0.10 to use vim.snippet
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
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
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }, { 'i', 's' }),
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
