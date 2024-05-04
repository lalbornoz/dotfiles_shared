lua << EOF
lazy_plugins["nvim-lsp-compl"] = {
config = function()
	require('lsp_compl').expand_snippet = nil
	require'lspconfig'.clangd.setup {
		on_attach=require'lsp_compl'.attach,
	}
	require'lspconfig'.pylsp.setup {
		on_attach=require'lsp_compl'.attach,
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
