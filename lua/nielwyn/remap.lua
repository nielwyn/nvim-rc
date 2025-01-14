-- buffer/relative line number
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s %l %=%r "

-- set leader key
vim.g.mapleader = " "

-- netrw directory listing
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- copy to system clipboard (visual)
vim.keymap.set("v", "y", '"+y', opt)

--comment/uncomment
local set_comment = require("nielwyn.set-comment")
vim.api.nvim_create_user_command("SetComment", set_comment.set, { range = true })
vim.keymap.set("v", "<leader>/", ":SetComment<CR>")
vim.keymap.set("n", "<leader>/", ":SetComment<CR>")
