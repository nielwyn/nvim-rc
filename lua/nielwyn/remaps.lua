vim.g.mapleader = " "

-- File explorer (MiniFiles or fallback)
vim.keymap.set("n", "<leader>e", function()
	local ok, mini_files = pcall(require, "mini.files")
	if ok and mini_files.open then
		mini_files.open()
	else
		vim.cmd.Ex()
	end
end, { desc = "Open file explorer" })

-- Yank to clipboard
vim.keymap.set("n", "y", '"+y', { desc = "Yank to clipboard", noremap = true })
vim.keymap.set("v", "y", '"+y', { desc = "Yank to clipboard", noremap = true })
vim.keymap.set("n", "Y", '"+Y', { desc = "Yank line to clipboard", noremap = true })

-- Disable 'q'
vim.keymap.set("n", "q", "<Nop>", { noremap = true })
vim.keymap.set("v", "q", "<Nop>", { noremap = true })

-- Disable clipboard copy after delete
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { noremap = true, desc = "Delete without yanking" })

-- Move selection up/down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv", { silent = true, desc = "Move selection down", noremap = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv", { silent = true, desc = "Move selection up", noremap = true })

-- Keep search match in middle
vim.keymap.set("n", "n", "nzz", { desc = "Next match center", noremap = true })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev match center", noremap = true })

-- Copy buffer path to clipboard
vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
vim.keymap.set('n', '<leader>yp', ':Cppath<CR>', { desc = "Copy buffer path" })

-- Indent and keep selection
vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Indent and keep selection" })
vim.keymap.set("v", ">", ">gv", { noremap = true, desc = "Outdent and keep selection" })
