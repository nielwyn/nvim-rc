local cmp = require('cmp')

cmp.setup {
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      max_item_count = 20,
      priority_weight = 1000,
      -- Add trigger characters for faster LSP completion
      trigger_characters = { '.', ':', '(', '"', "'", '/', '\\' }
    },
    {
      name = "path",
      priority_weight = 250,
      -- Optimize path completion
      option = {
        trailing_slash = true,
        label_trailing_slash = true,
      }
    },
    {
      name = "nvim_lua",
      priority_weight = 200
    },
  }, {
    -- Secondary sources (lower priority)
    {
      name = 'buffer',
      max_item_count = 5,
      priority_weight = 50,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            -- Only include visible buffers that aren't too large
            if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_line_count(buf) < 1000 then
              bufs[buf] = true
            end
          end
          return vim.tbl_keys(bufs)
        end
      }
    }
  }),
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
    completeopt = 'menu,menuone,noinsert',
    -- Reduce debounce time for faster suggestions
    keyword_length = 1,
  },

  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
    confirm_resolve_timeout = 80,
    async_budget = 1,
    max_view_entries = 200,
  },
}
