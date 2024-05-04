lua << EOF
lazy_plugins["nvim-lsp-compl"] = {
config = function()
	require'lspconfig'.bashls.setup{on_attach=require'lsp_compl'.attach}
	require'lspconfig'.clangd.setup{on_attach=require'lsp_compl'.attach}
	require'lspconfig'.lua_ls.setup{on_attach=require'lsp_compl'.attach}
	require'lspconfig'.pylsp.setup{on_attach=require'lsp_compl'.attach}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
