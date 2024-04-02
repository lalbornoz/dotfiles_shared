"
" Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
"

let g:roarie_startup_exit_on = has_key(g:, "roarie_startup_exit_on") ? g:roarie_startup_exit_on : [
	\ "h", "j", "k", "l",
	\ "<Left>", "<Down>", "<Up>", "<Right>",
	\ "b", "B", "e", "E",
	\ ]
let g:roarie_startup_exit_startinsert_on = has_key(g:, "roarie_startup_exit_startinsert_on") ? g:roarie_startup_exit_startinsert_on : [
	\ "i", "o",
	\ ]

let g:roarie_startup_hl_groups = has_key(g:, "roarie_startup_hl_groups") ? g:roarie_startup_hl_groups : []
let g:roarie_startup_hl_matches = has_key(g:, "roarie_startup_hl_matches") ? g:roarie_startup_hl_matches : []

let g:roarie_startup_options = has_key(g:, "roarie_startup_options") ? g:roarie_startup_options : [
	\ "bufhidden=wipe",
	\ "buftype=nofile",
	\ "filetype=terminal",
	\ "nobuflisted",
	\ "nocursorcolumn",
	\ "nocursorline",
	\ "nolist",
	\ "nomodifiable",
	\ "nomodified",
	\ "nonumber",
	\ "norelativenumber",
	\ "noswapfile",
	\ ]

let g:roarie_startup_progname_filter = '^[-gmnq]\=[n]\=vim\=x\=\%[\.exe]$'

let g:roarie_startup_screen_lines = has_key(g:, "roarie_startup_screen_lines") ? g:roarie_startup_screen_lines : []
let g:roarie_startup_screen_offset_x = has_key(g:, "roarie_startup_screen_offset_x") ? g:roarie_startup_screen_offset_x : 0

" {{{ fun! s:CentreBuffer(lines, offset_x, winnr)
fun! s:CentreBuffer(lines, offset_x, winnr)
	let buf_w = winwidth(a:winnr)
	let buf_h = winheight(a:winnr)
	let lines_w = 0
	let lines_h = len(a:lines)

	for line in a:lines
		let line_ = substitute(line, '\[[0-9;]\+m', "", "g")
		let line_w = strchars(line_)
		if line_w > lines_w
			let lines_w = line_w
		endif
	endfor

	let centre_w = (buf_w - lines_w) / 2
	let centre_h = (buf_h - lines_h) / 2
	let centre_w = (centre_w > 0) ? centre_w : 0
	let centre_h = (centre_h > 0) ? centre_h : 0

	return [centre_w + a:offset_x, centre_h]
endfun
" }}}
" {{{ fun! s:ExitBuffer()
fun! s:ExitBuffer()
	"
	" Delete autocmd group that resizes the buffer whenever the editor is
	" resized, delete the startup screen buffer, and create a new, empty buffer.
	"
	augroup StartupScreenResize
		autocmd!
	augroup END
	augroup! StartupScreenResize

	bdelete
	enew
endfun
" }}}
" {{{ fun! s:SetBuffer(bufno, winnr)
fun! s:SetBuffer(bufno, winnr)
	if bufwinnr(a:bufno) == -1
		return
	endif

	"
	" Temporarily switch to the window and buffer of the startup screen.
	"
	let winid_old = win_getid(winnr())
	call win_gotoid(win_getid(a:winnr))
	let bufno_old = bufnr("%")
	silent execute "buffer" a:bufno

	try
		setlocal modifiable modified
		silent execute ":%delete _"

		"
		" Apply highlight groups and add patterns to be highlighted.
		"
		for hl_group in g:roarie_startup_hl_groups
			execute "hi" join(hl_group, " ")
		endfor
		for hl_match in g:roarie_startup_hl_matches
			call matchadd(hl_match[0], hl_match[1])
		endfor

		"
		" Pre-append empty lines to horizontally startup screen lines,
		" if required, and append startup screen lines to buffer.
		"
		let centre = s:CentreBuffer(
			\ g:roarie_startup_screen_lines,
			\ g:roarie_startup_screen_offset_x,
			\ a:winnr)
		for line in range(centre[1])
		    call appendbufline(a:bufno, '$', '')
		endfor
		for line in g:roarie_startup_screen_lines
		    call appendbufline(a:bufno, '$', repeat(' ', centre[0]) . line)
		endfor

		setlocal nomodifiable nomodified
	finally
		"
		" Restore the original buffer and window.
		"
		silent execute "buffer" bufno_old
		call win_gotoid(winid_old)
	endtry
endfun
" }}}

" {{{ fun! s:EnterStartupScreen()
" <https://vi.stackexchange.com/questions/627/how-can-i-change-vims-start-or-intro-screen>
fun! s:EnterStartupScreen()
	"
	" Don't run if: we have command line arguments, we don't have an empty
	" buffer, if we're invoked w/ a progname not matching g:roarie_startup_progname_filter,
	" or if we start in insert mode.
	"
	if   argc()
	\ || line2byte('$') != -1
	\ || v:progname !~? g:roarie_startup_progname_filter
	\ || &insertmode
		return
	endif

	"
	" Start a new buffer, set local options for it, set the startup screen
	" within the buffer, and setup an autocommand to re-set the startup screen
	" within the buffer whenever the editor is resized.
	"
	enew
	execute "setlocal" join(g:roarie_startup_options, " ")
	let bufno = bufnr("%") | let winnr = winnr()
	call s:SetBuffer(bufno, winnr)
	augroup StartupScreenResize
		execute 'autocmd VimResized * call s:SetBuffer(' . bufno . ', ' . winnr . ')'
	augroup END

	"
	" Setup mappings to exit startup screen as per g:roarie_startup_exit_on;
	" exit startup screen on insert and start insert mode within a new buffer
	" as per g:roarie_startup_exit_startinsert_on.
	"
	for exit_on in g:roarie_startup_exit_on
		execute
			\ "nnoremap <buffer><silent>" exit_on
			\ ":call <SID>ExitBuffer()<CR>"
	endfor
	for exit_startinsert_on in g:roarie_startup_exit_startinsert_on
		execute
			\ "nnoremap <buffer><silent>" exit_startinsert_on
			\ ":call <SID>ExitBuffer() <bar> startinsert<CR>"
	endfor
endfun
" }}}

" Run after "doing all the startup stuff"
autocmd VimEnter * call <SID>EnterStartupScreen()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
