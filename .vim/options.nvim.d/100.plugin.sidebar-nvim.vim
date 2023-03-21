lua << EOF
	local sidebar = require("sidebar-nvim")
	sidebar.setup({
		bindings = nil,
		containers = { attach_shell = "/bin/sh", show_all = true, interval = 5000, },
		disable_default_keybindings = 0,
		hide_statusline = false,
		initial_width = 35,
		open = false,
		section_separator = {"", "-----", ""},
		section_title_separator = {""},
		sections = { "git", "diagnostics", "symbols", },
		side = "left",
		symbols = { icon = "ƒ", },
		update_interval = 1000,
	})

	local git = require("sidebar-nvim.builtin.git")
	git.bindings["<Enter>"] = git.bindings["e"]

	local diagnostics = require("sidebar-nvim.builtin.diagnostics")
	diagnostics.bindings["<Enter>"] = diagnostics.bindings["e"]

	local symbols = require("sidebar-nvim.builtin.symbols")
	symbols.bindings["<Enter>"] = symbols.bindings["e"]
EOF

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
