local gitsigns = require('gitsigns')

gitsigns.setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '-' },
    topdelete    = { text = 'X' },
    changedelete = { text = '±' },
    untracked    = { text = '?' },
  },
  signs_staged = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '-' },
    topdelete    = { text = 'X' },
    changedelete = { text = '±' },
    untracked    = { text = '?' },
  },
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 0,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.nav_hunk('next') end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.nav_hunk('prev') end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    -- Actions
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('v', '<leader>hr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { buffer = bufnr })

    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
  end,
}
