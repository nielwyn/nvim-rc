local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = "path",     priority_weight = 110 },
		{ name = "nvim_lsp", max_item_count = 20,  priority_weight = 100 },
		{ name = "nvim_lua", priority_weight = 90 },
		{
			name = 'buffer',
			max_item_count = 10,
			option = {
				get_bufnrs = function()
					local bufs = {}
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						bufs[vim.api.nvim_win_get_buf(win)] = true
					end
					return vim.tbl_keys(bufs)
				end
			}
		}
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body) -- Neovim v0.10+
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-j>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'select' })
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),

		['<C-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'select' })
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	completion = {
		preselect = 'item',
		completeopt = 'menu,menuone,noinsert'
	},
})
