lua << EOF
local telescope = require("telescope")

telescope.setup { 
	defaults = {
		mappings = {
			i = {
				["<C-Up>"] = require('telescope.actions').cycle_history_prev,
				["<C-Down>"] = require('telescope.actions').cycle_history_next,

				["<C-Left>"] = require('telescope.actions').preview_scrolling_left,
				["<C-Right>"] = require('telescope.actions').preview_scrolling_right,
				["<C-PageDown>"] = require('telescope.actions').preview_scrolling_down,
				["<C-PageUp>"] = require('telescope.actions').preview_scrolling_up,

				["<M-Left>"] = require('telescope.actions').results_scrolling_left,
				["<M-Right>"] = require('telescope.actions').results_scrolling_right,
			},
			n = {
				["<C-Up>"] = require('telescope.actions').cycle_history_prev,
				["<C-Down>"] = require('telescope.actions').cycle_history_next,

				["<C-Left>"] = require('telescope.actions').preview_scrolling_left,
				["<C-Right>"] = require('telescope.actions').preview_scrolling_right,
				["<C-PageDown>"] = require('telescope.actions').preview_scrolling_down,
				["<C-PageUp>"] = require('telescope.actions').preview_scrolling_up,

				["<M-Left>"] = require('telescope.actions').results_scrolling_left,
				["<M-Right>"] = require('telescope.actions').results_scrolling_right,
			},
		},
		path_display = { shorten = 3, },
		sorting_strategy = "ascending",
	},

	extensions = {
		menufacture = {
			mappings = {
				main_menu = { [{ 'i', 'n' }] = '<C-n>' },
			},
		},
	},
}
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
