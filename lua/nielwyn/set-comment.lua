local set_comment = {}

local default_line_comment = "//"

local non_c_line_comments_by_filetype = {
	lua = "--",
	sql = "--",
}

function set_comment.set(opts)
	local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype] or default_line_comment
	local start = math.min(opts.line1, opts.line2)
	local finish = math.max(opts.line1, opts.line2)
	local lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)	-- Get the lines to check
	for i, line in ipairs(lines) do
		local new_line = line:gsub("^%s*%-+%s*", "")	-- remove leading dashes and whitespace
		if new_line == line then
			return	{
				vim.api.nvim_exec2(start .. "," .. finish .. "s:^:" .. line_comment .. ":", {}),
				vim.api.nvim_cmd({ cmd = "noh" }, {})
			}
		end
		lines[i] = new_line
	end
	vim.api.nvim_buf_set_lines(0, start - 1, finish, false, lines)	-- set the modified lines back to the buffer
end

return set_comment
