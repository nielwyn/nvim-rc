require('fzf-lua').setup {
	defaults = {
		formatter = "path.filename_first",
	},
	winopts  = {
		height = 0.9,
		width = 0.9,
		preview = {
			layout = "vertical",
		}
	},
}
