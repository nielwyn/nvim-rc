require('mini.cursorword').setup {
	delay = 100
}

local timer = nil
_G.cursorword_blocklist = function()
	-- Debounce the function
	if timer then
		timer:stop()
	end

	timer = vim.defer_fn(function()
		local curword = vim.fn.expand('<cword>') or ''

		if curword == '' then
			vim.b.minicursorword_disable = false
			return
		end

		local filetype = vim.bo.filetype
		local blocklist = {}

		if filetype == 'lua' then
			blocklist = { 'local', 'require', 'vim' }
		elseif filetype == 'javascript' or filetype == 'typescript' or filetype == 'typescriptreact' then
			blocklist = { 'import' }
		end

		vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
	end, 50) -- 50ms delay
end

vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')
