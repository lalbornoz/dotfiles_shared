"
" [Function] OpenHeader(cmdline, ...): opens header file corresponding to the {C,C++} source module opened in the current window
"

fun! OpenHeader() abort
	let fname = expand("%:p")
	let fname_header = substitute(l:fname, '\.\(c\|cpp\|cxx\)$', ".h", "i")
	if filereadable(l:fname_header)
		new
		execute 'e!' fname_header
	else
		let fname = expand("%:p")
		let fname_header = substitute(l:fname, '\.\(cpp\|cxx\)$', ".hpp", "i")
		if filereadable(l:fname_header)
			new
			execute 'e!' fname_header
		else
			let fname = expand("%:p")
			let fname_header = substitute(l:fname, '\.\(cpp\|cxx\)$', ".hxx", "i")
			if filereadable(l:fname_header)
				new
				execute 'e!' fname_header
			else
			endif
		endif
	endif
endfun
command!	COpenHeader call OpenHeader()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
