"let g:gutentags_ctags_tagfile = "guten.tags"		" Name of tag file to create
let g:gutentags_cache_dir = "~/.cache/vim-gutentags"	" Create all tags files in ~/.cache/vim-gutentags
let g:gutentags_ctags_extra_args = ["--excmd=number", "--exclude=*", "--exclude-exception=*.sh"]	" List of arguments to pass to ctags
let g:gutentags_enabled = 0				" Don't enable Gutentags by default
"autocmd FileType sh	let g:gutentags_enabled = 1	" Enable Gutentags for Bourne shell files

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
