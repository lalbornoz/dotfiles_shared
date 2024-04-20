lua << EOF
lazy_plugins["mason.nvim"] = {
init = function()
	require("mason").setup()
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
