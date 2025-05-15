-- import
require("nielwyn.options")
require("nielwyn.remaps")
require("nielwyn.theme")

-- autocommand to redraw the status column on InsertLeave and TextChanged
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, { pattern = "*", command = "redrawstatus" })

-- for persistent undotree
if vim.fn.has("persistent_undo") then
	local target_path = vim.fn.expand('~/.undodir')
	-- create the directory and any parent directories
	if not vim.fn.isdirectory(target_path) then
		vim.fn.mkdir(target_path, "p", 0700)
	end
	vim.opt.undodir = target_path
	vim.opt.undofile = true
end
