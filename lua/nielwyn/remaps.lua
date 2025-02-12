vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", function()
	local mini_files = require("mini.files")
	if mini_files.open then
		mini_files.open()
	else
		vim.cmd.Ex()
	end
end)
vim.keymap.set("n", "<leader>be", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end)
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("v", "Y", '"+Y')
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "q", "<Nop>")

-- disalbe clipboard copy after delete operator
vim.keymap.set({ 'n', 'v' }, 'x', '"_x')

-- move whole line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- search term stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- make put operator replace line
--vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy buffer path
vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
vim.keymap.set('n', '<leader>yp', ':Cppath<CR>')
