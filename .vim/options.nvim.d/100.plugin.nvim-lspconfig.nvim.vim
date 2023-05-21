lua << EOF
require'lspconfig'.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--pch-storage=memory",
	},
	filetypes = {"c", "cpp", "objc", "objcpp"},
}

require'lspconfig'.omnisharp.setup {
	cmd = {
		"dotnet",
		vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"),
	},
	filetypes = {"cs"}
}

EOF

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
