vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", function ()
	local mini_files = require("mini.files")
	if mini_files.open then
		mini_files.open()
	else
		vim.cmd.Ex()
	end
end)
vim.keymap.set("n", "<leader>be", function ()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end )
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "q", "<Nop>")

-- move whole line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- search term stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- put operator replace line
--vim.keymap.set("x", "<leader>p", "\"_dP")
