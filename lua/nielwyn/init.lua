-- autocommand to redraw the status column on InsertLeave and TextChanged
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
	pattern = "*",
	command = "redrawstatus"
})

require("nielwyn.options")
require("nielwyn.remaps")
