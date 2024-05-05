lua << EOF
lazy_plugins["nvim-buildme"] = {
config = function()
	require("buildme").setup({
		buildfile = '.buildme.sh',	-- the build file to execute
		runfile = '.runme.sh',		-- the run file to execute
		interpreter = 'bash',		-- the interpreter to use (bash, python, ...)
		force = '',	 		-- the option to pass when the bang is used
		wincmd = 'split',		-- a command to run prior to a build job (split, vsplit, ...)
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
