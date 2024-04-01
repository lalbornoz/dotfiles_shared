lua << EOF
local telescope = require("telescope")

-- To get telescope-menufacture loaded and working with telescope,
-- you need to call load_extension:
telescope.load_extension 'menufacture'

telescope.extensions.menufacture.mappings = {
	main_menu = { [{ 'i', 'n' }] = '<C-^>' },
}

telescope.extensions.menufacture.find_files_menu['toggle wrap'] =
	function(opts, callback)
		if opts.wrap_results then
			opts.wrap_results = false
		else
			opts.wrap_results = true
			end
		callback(opts)
	end
telescope.extensions.menufacture.grep_string_menu['toggle wrap'] = telescope.extensions.menufacture.find_files_menu['toggle wrap']
telescope.extensions.menufacture.live_grep_menu['toggle wrap'] = telescope.extensions.menufacture.find_files_menu['toggle wrap']
telescope.extensions.menufacture.git_files_menu['toggle wrap'] = telescope.extensions.menufacture.find_files_menu['toggle wrap']
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
