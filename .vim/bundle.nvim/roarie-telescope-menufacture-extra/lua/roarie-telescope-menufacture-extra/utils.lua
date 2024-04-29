--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

-- {{{ function get_find_command(args_extra)
function get_find_command(args_extra)
	local cmd = nil

	-- (from telescope.nvim/lua/telescope/builtin/__files.lua:files.find_files())
	if 1 == vim.fn.executable "rg" then
		cmd = { "rg", "--files", "--color", "never" }
	elseif 1 == vim.fn.executable "fd" then
		cmd = { "fd", "--type", "f", "--color", "never" }
	elseif 1 == vim.fn.executable "fdfind" then
		cmd = { "fdfind", "--type", "f", "--color", "never" }
	elseif 1 == vim.fn.executable "find" and vim.fn.has "win32" == 0 then
		cmd = { "find", ".", "-type", "f" }
	elseif 1 == vim.fn.executable "where" then
		cmd = { "where", "/r", ".", "*" }
	end

	if vim.fn.exists(vim.fn.expand("~/.vim/bin/find_command")) then
		table.insert(cmd, 1, vim.fn.expand("~/.vim/bin/find_command"))
	end
	for _, arg in ipairs(args_extra) do
		table.insert(cmd, arg)
	end

	return cmd
end
-- }}}
-- {{{ function prepare_find_command(opts, remove_search_dir)
function prepare_find_command(opts, remove_search_dir)
	if opts.find_command ~= nil then
		if remove_search_dir and (opts.search_dirs ~= nil) then
			table.remove(opts.find_command, table.getn(opts.find_command))
		end
		if opts.hidden then
			local find_command_new = {}
			for _, cmd_item in ipairs(opts.find_command) do
				if string.match(cmd_item, '^--hidden$') == nil then
					table.insert(find_command_new, cmd_item)
				end
			end
			opts.find_command = find_command_new
		end
	end
end
-- }}}
-- {{{ function update_find_command(opts, arg_new, key, pattern, set_if)
function update_find_command(opts, arg_new, key, pattern, set_if)
	local find_command_new = {}
	for _, cmd_item in ipairs(opts.find_command) do
		if string.match(cmd_item, pattern) == nil then
			table.insert(find_command_new, cmd_item)
		end
	end
	opts.find_command = find_command_new

	if opts.search_dirs ~= nil then
		table.remove(opts.find_command, table.getn(opts.find_command))
	end
	if set_if then
		table.insert(opts.find_command, arg_new)
	end
end
-- }}}
-- {{{ function update_additional_args(opts, arg_new, pattern, set_if)
function update_additional_args(opts, arg_new, pattern, set_if)
	local additional_args_new = {}
	for _, arg in ipairs(opts.additional_args) do
		if string.match(arg, pattern) == nil then
			table.insert(additional_args_new, arg)
		end
	end
	opts.additional_args = additional_args_new
	if set_if then
		table.insert(opts.additional_args, arg_new)
	end
end
-- }}}

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
