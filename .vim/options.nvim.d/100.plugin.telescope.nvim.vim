lua << EOF
require("telescope").setup { 
	defaults = {
		path_display = { shorten = 5, },
		sorting_strategy = "ascending",
	},
}

-- To get telescope-menufacture loaded and working with telescope,
-- you need to call load_extension:
require('telescope').load_extension 'menufacture'
EOF

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
