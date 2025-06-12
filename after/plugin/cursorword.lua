require('mini.cursorword').setup({
  delay = 100
})

_G.cursorword_blocklist = function()
  local curword = vim.fn.expand('<cword>')
  local filetype = vim.bo.filetype

  -- Add any disabling global or filetype-specific logic here
  local blocklist = {}
  if filetype == 'lua' then
    blocklist = { 'local', 'require', 'vim' }
  elseif filetype == 'javascript' then
    blocklist = { 'import' }
  elseif filetype == 'typescript' then
    blocklist = { 'import' }
  elseif filetype == 'typescriptreact' then
    blocklist = { 'import' }
  end

  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end

vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')
