let g:lightline = {
	\ 'active': {
	\	'right': [ [ 'lineinfo_full' ],
	\		   [ 'percent' ],
	\		   [ 'case', 'fileformat', 'fileencoding', 'filetype' ] ]
	\ },
	\ 'component': {
	\	'case':			'%{&ignorecase!=#1?"CASE":"cAsE"}',
	\	'lineinfo_full':	'%l,%c%V/%L %P'
	\ },
	\ }

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
