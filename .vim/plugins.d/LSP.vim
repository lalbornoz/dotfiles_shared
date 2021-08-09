let g:lsp_diagnostics_echo_cursor = 1		" Echo of diagnostic error for current line to status
let g:lsp_settings = {
	\ 'clangd': {
	\	'cmd': ['clangd', '--background-index', '--pch-storage=memory']
	\ }
	\ }

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
