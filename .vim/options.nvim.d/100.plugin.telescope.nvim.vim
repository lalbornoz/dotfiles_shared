lua << EOF
lazy_plugins["telescope.nvim"] = {
config = function()
	local telescope = require("telescope")

	telescope.setup {
		-- {{{ defaults = {}
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
			path_display = { shorten = 10, },
			sorting_strategy = "ascending",
		},
		-- }}}
		extensions = {
			-- {{{ extensions.menufacture = {}
			menufacture = {
				max_depth_initial = 4,
				mappings = {
					main_menu = { [{ 'i', 'n' }] = '<C-^>' },
					change_into_directory = { i = '<C-d>' },
					change_into_parent_directory = { i = '<C-p>' },
					decrease_maximum_depth = { i = '<M-->' },
					increase_maximum_depth = { i = '<M-=>' },
					decrease_path_shorten = { i = '<C-[>' },
					increase_path_shorten = { i = '<C-]>' },
					live_grep_here = { i = '<C-g>' },
					toggle_hidden = { i = '<C-h>' },
					toggle_wrap = { i = '<C-p>' },
				},
			},
			-- }}}
			-- {{{ extensions.file_browser = {}
			file_browser = {
				theme = "ivy",

				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,

				mappings = {
					["i"] = {},
					["n"] = {},
				},
			},
			-- }}}
		},
		-- {{{ pickers = {}
		pickers = {
			find_files = { prompt_title = "Files (<C-/> help <C-^> opts)", },
			live_grep = { prompt_title = "Grep (<C-/> help <C-^> opts)", },
		},
		-- }}}
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
