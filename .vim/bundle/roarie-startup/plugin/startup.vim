"
" Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
"

" {{{ let g:startup_screen_lines = [...]
if has("nvim")
let g:startup_screen_lines = [
\ '   [40m[37m              [40m[34m▃▃▃▃[0m',
\ '   [40m[37m           [40m[34m▟[44m[94m        [40m[34m▙[0m',
\ '   [40m[35m▟▙▃▟▙      [44m[34m [44m[33m/\[34m[34m    [34m[33m/\[34m[34m [40m[37m    [40m[97mroar![0m',
\ '   [40m[35m▜[40m[95m▒▓▒[40m[35m▛      [104m[94m  [103m[94m▛ [103m[33m""" [103m[94m▜[104m[34m [40m[37m   [40m[97m/[0m',
\ '   [40m[37m [40m[35m▜[45m[35m [40m[35m▛       [104m[94m [103m[30m  ^ _ ^ [104m[94m [40m[37m  [40m[97m/[0m',
\ '   [40m[37m  [40m[35m▀        [46m[36m [103m[33m (__[103m[30my[103m[33m_)[103m[30m [46m[36m [0m',
\ '   [40m[37m [40m[93m▟▙    ▁▂▃▟[103m[36m▐[40m[36m▙[40m[93m▜[103m[33m`\_/[40m[93m▛[40m[36m▟▌[0m',
\ '   [40m[37m [40m[93m▟▙   ▟[103m[30m    [103m[36m▓▓▓[103m[30m| |[40m[93m▍[40m[36m▓▓▓[0m',
\ '   [40m[37m [40m[93m▜[103m[30m\[40m[93m▙ ▟[103m[30m    [103m[36m▓▓▓▓▓[103m[30m |[40m[36m▓▓▓▓▓[0m',
\ '   [40m[37m  [40m[93m▜[103m[30m\\roa \ [103m[36m▒▒▒[103m[30m|[103m[33m [103m[30m|[40m[37m [40m[36m▒▒▒[0m',
\ '   [40m[37m   [40m[93m▜[103m[30m\ rie ) [103m[36m▒[103m[30m_|[103m[33m [103m[30m|[40m[93m▙ [40m[36m▒[0m',
\ '   [40m[37m   [103m[30m([4m     /  ))))))[0m',
\ '',
\ 'Press [1m<Alt>m[0m for mappings menu,',
\ '  [1m<Ctrl>p[0m for command palette']
else
let g:startup_screen_lines = [
\ 'Press <Alt>m for mappings menu']
endif
" }}}

" {{{ fun! VESSStartupBufCentre(lines, winnr)
fun! VESSStartupBufCentre(lines, winnr)
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
" {{{ fun! VESSStartupBufSet(bufno, winnr)
fun! VESSStartupBufSet(bufno, winnr)
	if bufwinnr(a:bufno) == -1
		return
	endif

	let centre = VESSStartupBufCentre(g:startup_screen_lines, a:winnr)

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
		for line in g:startup_screen_lines
		    call appendbufline(a:bufno, '$', repeat(' ', centre[0]) . line)
		endfor

		setlocal nomodifiable nomodified
	finally
		silent execute "buffer" bufno_old
		call win_gotoid(winid_old)
	endtry
endfun
" }}}
" {{{ fun! VESSStartupExit()
fun! VESSStartupExit()
	augroup StartupScreen
		autocmd!
	augroup END
	augroup! StartupScreen

	bdelete
	enew
endfun
" }}}
" {{{ fun! VimEnterStartupScreen()
" <https://vi.stackexchange.com/questions/627/how-can-i-change-vims-start-or-intro-screen>
fun! VimEnterStartupScreen()
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
	call VESSStartupBufSet(bufno, winnr)

	" When we go to insert mode start a new buffer, and start insert
	nnoremap <buffer><silent> e :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> h :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> j :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> k :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> l :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> <Left> :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> <Down> :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> <Up> :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> <Right> :call VESSStartupExit()<CR>
	nnoremap <buffer><silent> i :call VESSStartupExit() <bar> startinsert<CR>
	nnoremap <buffer><silent> o :call VESSStartupExit() <bar> startinsert<CR>

	augroup StartupScreen
		execute 'autocmd VimResized * call VESSStartupBufSet(' . bufno . ', ' . winnr . ')'
	augroup END
endfun
" }}}

" Run after "doing all the startup stuff"
autocmd VimEnter * call VimEnterStartupScreen()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
