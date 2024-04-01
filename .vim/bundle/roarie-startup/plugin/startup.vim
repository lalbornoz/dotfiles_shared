"
" Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
"

let g:roarie_startup_hl_groups = has_key(g:, "roarie_startup_hl_groups") ? g:roarie_startup_hl_groups : []
let g:roarie_startup_hl_matches = has_key(g:, "roarie_startup_hl_matches") ? g:roarie_startup_hl_matches : []
let g:roarie_startup_screen_lines = has_key(g:, "roarie_startup_screen_lines") ? g:roarie_startup_screen_lines : []

" {{{ fun! s:CentreBuffer(lines, winnr)
fun! s:CentreBuffer(lines, winnr)
	let buf_w = winwidth(a:winnr)
	let buf_h = winheight(a:winnr)
	let lines_w = 0
	let lines_h = len(a:lines)

	for line in a:lines
		let line_ = substitute(line, '\[[0-9]\+m', "", "g")
		let line_w = strchars(line_)
		if line_w > lines_w
			let lines_w = line_w
		endif
	endfor

	let centre_w = (buf_w - lines_w) / 2
	let centre_h = (buf_h - lines_h) / 2
	let centre_w = (centre_w > 0) ? centre_w : 0
	let centre_h = (centre_h > 0) ? centre_h : 0

	return [centre_w, centre_h]
endfun
" }}}
" {{{ fun! s:ExitBuffer()
fun! s:ExitBuffer()
	augroup StartupScreen
		autocmd!
	augroup END
	augroup! StartupScreen

	bdelete
	enew
endfun
" }}}
" {{{ fun! s:SetBuffer(bufno, winnr)
fun! s:SetBuffer(bufno, winnr)
	if bufwinnr(a:bufno) == -1
		return
	endif

	let centre = s:CentreBuffer(g:roarie_startup_screen_lines, a:winnr)

	let winid_old = win_getid(winnr())
	call win_gotoid(win_getid(a:winnr))
	let bufno_old = bufnr("%")
	silent execute "buffer" a:bufno

	try
		setlocal modifiable modified
		silent execute ":%delete _"

		for line in range(centre[1])
		    call appendbufline(a:bufno, '$', '')
		endfor
		for line in g:roarie_startup_screen_lines
		    call appendbufline(a:bufno, '$', repeat(' ', centre[0]) . line)
		endfor

		for hl_group in g:roarie_startup_hl_groups
			execute "hi" join(hl_group, " ")
		endfor
		for hl_match in g:roarie_startup_hl_matches
			call matchadd(hl_match[0], hl_match[1])
		endfor

		"silent! setl nonu nornu nobl acd ft=dashboard bh=wipe bt=nofile

		setlocal nomodifiable nomodified
	finally
		silent execute "buffer" bufno_old
		call win_gotoid(winid_old)
	endtry
endfun
" }}}

" {{{ fun! s:EnterStartupScreen()
" <https://vi.stackexchange.com/questions/627/how-can-i-change-vims-start-or-intro-screen>
fun! s:EnterStartupScreen()
	" Don't run if: we have commandline arguments, we don't have an empty
	" buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=[n]\=vim\=x\=\%[\.exe]$' || &insertmode
		return
	endif

	" Start a new buffer and set some options for it
	enew
	setlocal
		\ bufhidden=wipe
		\ buftype=nofile
		\ filetype=terminal
		\ nobuflisted
		\ nocursorcolumn
		\ nocursorline
		\ nolist
		\ nomodifiable
		\ nomodified
		\ nonumber
		\ norelativenumber
		\ noswapfile

	"
	" Now we can just write to the buffer, whatever you want.
	"
	let bufno = bufnr("%")
	let winnr = winnr()
	call s:SetBuffer(bufno, winnr)

	" When we go to insert mode start a new buffer, and start insert
	nnoremap <buffer><silent> e :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> h :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> j :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> k :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> l :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> <Left> :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> <Down> :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> <Up> :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> <Right> :call <SID>ExitBuffer()<CR>
	nnoremap <buffer><silent> i :call <SID>ExitBuffer() <bar> startinsert<CR>
	nnoremap <buffer><silent> o :call <SID>ExitBuffer() <bar> startinsert<CR>

	augroup StartupScreen
		execute 'autocmd VimResized * call s:SetBuffer(' . bufno . ', ' . winnr . ')'
	augroup END
endfun
" }}}

" Run after "doing all the startup stuff"
autocmd VimEnter * call <SID>EnterStartupScreen()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
