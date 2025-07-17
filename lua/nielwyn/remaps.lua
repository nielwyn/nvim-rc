vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", function()
	local ok, mini_files = pcall(require, "mini.files")
	if ok and mini_files.open then
		mini_files.open()
	else
		vim.cmd.Ex()
	end
end)

vim.keymap.set("n", "y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "Y", '"+Y', { desc = "Yank line to clipboard" })

vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("v", "q", "<Nop>")

-- disalbe clipboard copy after delete operator
vim.keymap.set({ 'n', 'v' }, 'x', '"_x')

-- move whole line
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv", { silent = true, desc = "Move selection down", remap = false })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv", { silent = true, desc = "Move selection up", remap = false })

-- search term stay in middle
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- make put operator replace line
--vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy buffer path
vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
vim.keymap.set('n', '<leader>py', ':Cppath<CR>')

vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Indent and keep selection" })
vim.keymap.set("v", ">", ">gv", { noremap = true, desc = "Outdent and keep selection" })

vim.keymap.set('n', '<leader>li', function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		print("No LSP clients attached to this buffer")
	else
		for _, client in ipairs(clients) do
			print("LSP client: " .. client.name)
		end
	end
end, { desc = "Show LSP info" })
