lua << EOF
lazy_plugins["nvim-lspconfig"] = {
init = function()
	require'lspconfig'.clangd.setup {
		cmd = {
			"clangd",
			"--background-index",
			"--pch-storage=memory",
		},
		filetypes = {"c", "cpp", "objc", "objcpp"},
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
