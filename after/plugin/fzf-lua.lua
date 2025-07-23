local fzf = require('fzf-lua')

fzf.setup({
  defaults = {
    formatter = "path.filename_first",
  },
  winopts  = {
    height = 0.9,
    width = 0.9,
    preview = {
      layout = "vertical",
    }
  },
})

vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = 'fzf resume' })
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'fzf `find` or `fd` on a path' })
vim.keymap.set('n', '<leader>fg', fzf.grep, { desc = 'fzf search with grep or rg pattern' })
vim.keymap.set('n', '<leader>fc', fzf.grep_cword, { desc = 'fzf search word under cursor' })
vim.keymap.set('n', '<leader>fb', fzf.lgrep_curbuf, { desc = 'fzf live grep current buffer' })
vim.keymap.set('n', '<leader>fl', fzf.live_grep, { desc = 'fzf live grep (with glob support)' })
