require('gitsigns').setup {
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
}
