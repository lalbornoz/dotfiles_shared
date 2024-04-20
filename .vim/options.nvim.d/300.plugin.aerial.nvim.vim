lua << EOF
lazy_plugins["aerial.nvim"] = {
config = function()
	require("aerial").setup({
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
