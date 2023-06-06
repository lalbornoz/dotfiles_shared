lua << EOF
require'lspconfig'.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--pch-storage=memory",
	},
	filetypes = {"c", "cpp", "objc", "objcpp"},
}

EOF

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
