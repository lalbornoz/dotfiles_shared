lua << EOF
lazy_plugins["telescope-menufacture"] = {
config = function()
	local telescope = require("telescope")
	local action_state = require("telescope.actions.state")
	local action_utils = require("telescope.actions.utils")
	local actions = require("telescope.actions")
	local conf = require("telescope.config").values
	local menufacture = telescope.extensions.menufacture
	local pickers = require("telescope.pickers")

	-- To get telescope-menufacture loaded and working with telescope,
	-- you need to call load_extension:
	telescope.load_extension 'menufacture'

	-- {{{ local function prepare_find_command(opts, remove_search_dir)
	local function prepare_find_command(opts, remove_search_dir)
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
	-- {{{ local function update_find_command(opts, arg_new, key, pattern, set_if)
	local function update_find_command(opts, arg_new, key, pattern, set_if)
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
	-- {{{ local function update_additional_args(opts, arg_new, pattern, set_if)
	local function update_additional_args(opts, arg_new, pattern, set_if)
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

	-- {{{ menufacture.{find_files,live_grep}_menu['back...']
	menufacture.find_files_menu['back...'] =
	function(opts, callback)
		callback(opts)
	end
	menufacture.live_grep_menu['back...'] = menufacture.find_files_menu['back...']
	-- }}}
	-- {{{ menufacture.{find_files,live_grep}_menu['change directory']
	menufacture.find_files_menu['change directory'] =
	function(opts, callback)
		pickers.new({}, {
			prompt_title = 'select directory',
			finder = menufacture.folder_finder(opts),
			sorter = conf.generic_sorter {},
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					local entry = action_state.get_selected_entry()
					vim.fn.chdir(entry.path or entry.filename or entry.value)
					actions.close(prompt_bufnr)
					prepare_find_command(opts, false)
					callback(opts)
				end)
				return true
			end,
		})
		:find()
		return opts
	end
	menufacture.live_grep_menu['change directory'] = menufacture.find_files_menu['change directory']
	-- }}}
	-- {{{ menufacture.{find_files,live_grep}_menu['search in directory']
	menufacture.find_files_menu['search in directory'] =
	function(opts, callback)
		pickers.new({}, {
			prompt_title = 'select directory',
			finder = menufacture.folder_finder(opts),
			sorter = conf.generic_sorter {},
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					local dirs = {}
					action_utils.map_selections(prompt_bufnr, function(entry)
						table.insert(dirs, entry.path or entry.filename or entry.value)
					end)
					if vim.tbl_count(dirs) == 0 then
						local entry = action_state.get_selected_entry()
						table.insert(dirs, entry.path or entry.filename or entry.value)
					end
					actions.close(prompt_bufnr)
					prepare_find_command(opts, true)
					opts["search_dirs"] = dirs
					callback(opts)
				end)
				return true
			end,
		})
		:find()
		return opts
	end
	menufacture.live_grep_menu['search in directory'] = menufacture.find_files_menu['search in directory']
	-- }}}
	-- {{{ menufacture.{find_files,live_grep}_menu['set maximum depth']
	menufacture.find_files_menu['set maximum depth'] =
	function(opts, callback)
		menufacture.input("max_depth", "Maximum directory depth: ")(opts, function(opts, callback) end)
		update_find_command(opts, "--max-depth=" .. opts.max_depth, "max_depth", '^--max%-depth=%d+$', (opts.max_depth ~= nil))
		callback(opts)
	end

	menufacture.live_grep_menu['set maximum depth'] =
	function(opts, callback)
		menufacture.input("max_depth", "Maximum directory depth: ")(opts, function(opts, callback) end)
		update_additional_args(opts, "--max-depth=" .. opts.max_depth, '^--max%-depth=%d+$', (opts.max_depth ~= nil))
		callback(opts)
	end
	-- }}}
	-- {{{ menufacture.{find_files,live_grep}_menu['toggle hidden']
	menufacture.find_files_menu['toggle hidden'] =
	function(opts, callback)
		menufacture.toggle("hidden")(opts, function(opts, callback) end)
		update_find_command(opts, "--hidden", "hidden", '^--hidden$', (opts.hidden))
		callback(opts)
	end

	menufacture.live_grep_menu['toggle hidden'] =
	function(opts, callback)
		opts.hidden = not opts.hidden
		update_additional_args(opts, "--hidden", '^--hidden$', (opts.hidden))
		callback(opts)
	end
	-- }}}
	-- {{{ menufacture.{find_files,live_grep}_menu['toggle wrap']
	menufacture.find_files_menu['toggle wrap'] =
	function(opts, callback)
		opts.wrap_results = not opts.wrap_results
		callback(opts)
	end
	menufacture.live_grep_menu['toggle wrap'] = menufacture.find_files_menu['toggle wrap']
	-- }}}

	-- {{{ menufacture.defaults = {}
	menufacture.defaults = {}
	menufacture.defaults.find_files = function()
		menufacture.find_files({
			hidden=false,
			max_depth=2,
			find_command={ "rg", "--files", "--color", "never", "--max-depth=2", },
		})
	end
	menufacture.defaults.live_grep = function()
		menufacture.live_grep({
			additional_args={'--hidden', '--max-depth=2'},
			['flag_additional_args--hidden']=true,
			hidden=true,
			max_depth=2,
		})
	end
	menufacture.defaults.live_grep_buffer = function()
		menufacture.live_grep({
			path_display="hidden",
			search_dirs={"%:p"},
		})
	end
	-- }}}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
