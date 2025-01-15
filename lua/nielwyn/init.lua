-- autocommand to redraw the status column on specific events
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
    pattern = "*",
    command = "redrawstatus"
})

-- comment/uncomment
local set_comment = {}
local default_line_comment = "//"
local non_c_line_comments_by_filetype = {
	lua = "--",
	sql = "--",
}
function set_comment.set(opts)
	local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype]
	or default_line_comment
	local start = math.min(opts.line1, opts.line2)
	local finish = math.max(opts.line1, opts.line2)
	-- Get the lines to check
	local lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)
	for i, line in ipairs(lines) do
		-- remove leading dashes and whitespace
		local new_line = line:gsub("^%s*%-+%s*", "")
		if new_line == line then
			return	{
				vim.api.nvim_exec2(start .. "," .. finish .. "s:^:" .. line_comment .. ":", {}),
				vim.api.nvim_cmd({ cmd = "noh" }, {})
			}
		end
		lines[i] = new_line
	end
	-- set the modified lines back to the buffer
	vim.api.nvim_buf_set_lines(0, start - 1, finish, false, lines)
end
vim.api.nvim_create_user_command("SetComment", set_comment.set, {range = true})
vim.keymap.set("n", "<leader>/", ":SetComment<CR>")

-- import remap
require("nielwyn.remap")
