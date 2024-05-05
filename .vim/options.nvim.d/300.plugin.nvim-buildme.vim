lua << EOF
lazy_plugins["nvim-buildme"] = {
config = function()
	require("buildme").setup({
		buildfile = '.buildme.sh',	-- the build file to execute
		runfile = '.runme.sh',		-- the run file to execute
		edit_on_nonexistent = false,	-- edit non-existent build/run file on build/run
		interpreter = 'bash',		-- the interpreter to use (bash, python, ...)
		force = '',	 		-- the option to pass when the bang is used
		save_current_wd = true,		-- save working directory of editor at startup; used to look for {build,run}file
		wincmd = 'split',		-- a command to run prior to a build job (split, vsplit, ...)
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0