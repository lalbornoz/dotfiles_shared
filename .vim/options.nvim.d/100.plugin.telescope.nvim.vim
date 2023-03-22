lua << EOF
local telescope = require("telescope")

telescope.setup { 
	defaults = {
		mappings = {
			i = {
				["<C-Up>"] = require('telescope.actions').cycle_history_prev,
				["<C-Down>"] = require('telescope.actions').cycle_history_next,
				["<C-PageDown>"] = require('telescope.actions').preview_scrolling_down,
				["<C-PageUp>"] = require('telescope.actions').preview_scrolling_up,
			},
			n = {
				["<C-Up>"] = require('telescope.actions').cycle_history_prev,
				["<C-Down>"] = require('telescope.actions').cycle_history_next,
				["<C-PageDown>"] = require('telescope.actions').preview_scrolling_down,
				["<C-PageUp>"] = require('telescope.actions').preview_scrolling_up,
			},
		},
		path_display = { shorten = 3, },
		sorting_strategy = "ascending",
	},
}

-- To get telescope-menufacture loaded and working with telescope,
-- you need to call load_extension:
telescope.load_extension 'menufacture'

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

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
