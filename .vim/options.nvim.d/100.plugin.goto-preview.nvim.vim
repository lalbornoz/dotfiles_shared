if has('nvim')
lua << EOF
	require('goto-preview').setup {
		dismiss_on_move = true;
		focus_on_open = false;
	}
EOF
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
