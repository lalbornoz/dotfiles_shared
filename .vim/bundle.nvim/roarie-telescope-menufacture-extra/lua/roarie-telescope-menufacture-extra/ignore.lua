--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

local telescope = require("telescope")
local menufacture = telescope.extensions.menufacture

menufacture.find_files_menu['edit ignore patterns...'] =
function(opts, callback)
	vim.ui.input({
		prompt="Ignore patterns in Lua syntax or {}: ",
		default=vim.inspect(opts.file_ignore_patterns or {}),
	}, function(input)
		opts.file_ignore_patterns = load(
			"return " .. input)()
	end)
	callback(opts)
end

menufacture.find_files_menu['toggle ignore ^%.git/'] =
function(opts, callback)
	opts.ignore_gitdir_state = not opts.ignore_gitdir_state
	if opts.ignore_gitdir_state then
		opts.file_ignore_patterns = {'^%.git/'}
	else
		file_ignore_patterns_new = {}
		for _, pattern in ipairs(opts.file_ignore_patterns or {}) do
			if pattern ~= '^%.git/' then
				table.insert(file_ignore_patterns_new, pattern)
			end
		end
		opts.file_ignore_patterns = file_ignore_patterns_new
	end
	callback(opts)
end


menufacture.live_grep_menu['edit ignore patterns...'] = menufacture.find_files_menu['edit ignore patterns...']
menufacture.live_grep_menu['toggle ignore ^%.git/'] = menufacture.find_files_menu['toggle ignore ^%.git/']

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
