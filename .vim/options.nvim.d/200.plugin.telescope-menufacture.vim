lua << EOF
lazy_plugins["telescope-menufacture"] = {
config = function()
	-- {{{ function apply_mappings(mappings, mappings_default, map)
	function apply_mappings(mappings, mappings_default, map)
		local applied_mappings = {}

		for mode, mode_map in pairs(mappings_default or {}) do
			for key_bind, key_func in pairs(mode_map or {}) do
				local mappings_ = nil
				if mappings[mode] ~= nil then
					mappings_ = mappings[mode]
				elseif mappings[string.lower(mode)] ~= nil then
					mappings_ = mappings[string.lower(mode)]
				end

				if not ((mappings_ ~= nil) and (mappings_[key_bind] == "disable")) then
					mappings_[key_bind] = key_func
				end
			end
		end

		for mode, mode_map in pairs(mappings or {}) do
			mode = string.lower(mode)

			applied_mappings[mode] = {}
			for key_bind, key_func in pairs(mode_map or {}) do
				if key_func ~= "disable" then
					local key_bind_internal = vim.api.nvim_replace_termcodes(key_bind, true, true, true)
					if not applied_mappings[mode][key_bind_internal] then
						applied_mappings[mode][key_bind_internal] = true
						map(mode, key_bind, key_func)
					end
				end
			end
		end
	end
	-- }}}
	-- {{{ function attach_mappings(_, map)
	function attach_mappings(_, map)
		local config = require("telescope.config").values
		apply_mappings(config.default_mappings, config.mappings, map)

		-- needs to return true if you want to map default_mappings and
		-- false if not
		return false
	end
	-- }}}

	local telescope = require("telescope")
	local menufacture = telescope.extensions.menufacture

	-- To get telescope-menufacture loaded and working with telescope,
	-- you need to call load_extension:
	telescope.load_extension 'menufacture'

	menufacture.defaults = {}

	menufacture.defaults.find_files = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			attach_mappings=attach_mappings,
			hidden=false,
			max_depth=nil,
			find_command=get_find_command({}),
			ignore_gitdir_state=true,
			file_ignore_patterns = {'^%.git/'},
		})
		menufacture.find_files(opts)
	end

	menufacture.defaults.live_grep = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			attach_mappings=attach_mappings,
			additional_args={'--hidden'}, ['flag_additional_args--hidden']=true,
			file_ignore_patterns = {'^%.git/'},
			hidden=true,
			ignore_gitdir_state=true,
			max_depth=nil,
		})
		menufacture.live_grep(opts)
	end

	menufacture.defaults.live_grep_buffer = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			attach_mappings=attach_mappings,
			path_display="hidden",
			search_dirs={"%:p"},
		})
		menufacture.live_grep(opts)
	end
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
