"
" [AutoCmds] VimEnterStartupScreen
"

" {{{ let g:startup_screen_lines = [...]
if has("nvim")
let g:startup_screen_lines = [
\ '[40m[37m[40m[37m      [46m[36m [0m[0m',
\ '[40m[37m[40m[37m     [46m[36m   [0m[0m',
\ '[40m[37m[40m[37m    [46m[36m     [0m[37m [106m[96m                  [0m[37m                                [40m[90m▒[0m[0m',
\ '[40m[37m[40m[37m   [46m[36m [103m[93m [103m[30m [103m[93m  [0m[37m  [105m[95m                  [0m[37m                [0m[34m▃▃▃▃[0m[37m           [40m[90m▒▒▒[0m[0m',
\ '[40m[37m[40m[37m  [46m[36m [4m[103m[30m_^__^_[24m[0m[37m [107m[97m                  [41m[31m   [0m[37m          [0m[34m▟[44m[34m        [0m[34m▙[0m[37m       [0m[90m▒▒▒▒▒[0m[0m',
\ '[40m[37m[40m[37m [46m[36m   [103m[93m    [0m[37m  [105m[95m                  [41m[31m [103m[33m/[103m[35m▟[41m[35m▙[0m[35m▃▟▙      [44m[34m [44m[33m/\[44m[34m    [44m[33m/\[44m[34m [0m[37m      [0m[90m▒[103m[93m    [0m[0m',
\ '[40m[37m[46m[36m     [103m[93m  [0m[37m   [106m[96m                  [103m[93m [41m[31m [41m[35m▜[0m[95m▒▓▒[0m[35m▛      [104m[94m  [103m[394m▛ [103m[33m""" [103m[94m▜[104m[34m [0m[37m     [0m[90m▒[4m[103m[30m_^__^_[0m[0m',
\ '[40m[37m[40m[37m [46m[36m   [44m[34m    [0m[37m  [0m[97m▏[103m[31m%[0m[37m       [41m[97m [103m[97m   [103m[32m>[103m[97m [103m[30m_[103m[97m [103m[32m<[103m[97m   [103m[35m▜[45m[35m [0m[35m▛       [104m[94m [103m[30m  ^ _ ^ [104m[34m [0m[37m    [0m[90m▒▒▒[103m[93m    [0m[0m',
\ '[40m[37m[40m[37m  [103m[93m [0m[37m [44m[34m [44m[97mKA[44m[34m [0m[37m [103m[93m [0m[97m▏[0m[37m       [103m[30m;[41m[33m  [103m[31m [103m[33m(__[103m[30mY[103m[33m__)[103m[30m [41m[31m [41m[97m [0m[35m▀        [46m[36m [103m[33m (__[103m[30my[103m[33m_)[103m[30m [46m[36m [0m[37m   [0m[90m▒▒▒▒▒[103m[93m  [0m[0m',
\ '[40m[37m[40m[37m   [103m[93m [44m[34m [44m[97mDE [103m[93m [103m[30m([0m[37m       [103m[30m/[103m[33m [103m[97m  [41m[97m  [103m[33m`\_/[41m[30m [41m[97m  [0m[37m [0m[93m▟▙    ▁▂▃▟[103m[36m▐[0m[36m▙[0m[93m▜[103m[33m`\_/[0m[93m▛[0m[36m▟▌[0m[37m    [0m[90m▒▒▒[104m[97m NA [0m[0m',
\ '[40m[37m[40m[37m    [44m[34m    [0m[37m [103m[30m\\[0m[37m    [103m[30m.'' a[103m[97m  [103m[31m  [41m[31m     [0m[37m   [0m[93m▟▙   ▟[103m[30m    [103m[36m▓▓▓[103m[30m| |[0m[93m▍[0m[36m▓▓▓[0m[37m     [0m[90m▒[103m[93m [104m[97m DIA[103m[93m [0m[0m',
\ '[40m[37m[40m[37m    [100m[90m [0m[37m [0m[97m [100m[90m [0m[37m  [103m[30m\\[0m[37m  [103m[30m/[103m[97m  [103m[30mr[103m[97m      [41m[97m   [0m[37m    [0m[93m▜[103m[30m\[0m[93m▙ ▟[103m[30m    [103m[36m▓▓▓▓▓[103m[30m |[0m[36m▓▓▓▓▓[0m[37m     [103m[93m [104m[94m    [103m[93m [0m[0m',
\ '[40m[37m[40m[37m    [100m[90m [0m[37m  [100m[90m [0m[37m   [103m[30m\\/  a[103m[97m [103m[30m\[103m[97m    [103m[30m|[103m[33m [103m[30m|[0m[37m      [0m[93m▜[103m[30m\\roa \ [103m[36m▒▒▒[103m[30m|[103m[33m [103m[30m|[0m[37m [0m[36m▒▒▒[0m[37m       [47m[37m [0m[37m  [47m[37m [0m[0m',
\ '[40m[37m[40m[37m    [100m[90m [0m[97m [0m[37m [100m[90m [0m[37m    [103m[30m\[103m[33m  [103m[30mb[103m[33m   [103m[30m)___|[103m[33m [103m[30m|[0m[37m       [0m[93m▜[103m[30m\ rie ) [103m[36m▒[103m[30m_|[103m[33m [103m[30m|[0m[93m▙ [0m[36m▒[0m[37m        [47m[37m [0m[37m  [47m[37m [0m[0m',
\ '[40m[37m[40m[37m    [100m[90m [0m[97m  [100m[90m [0m[37m   [103m[30m(_____/__)))))))[0m[37m       [103m[30m([4m     /  ))))))[24m[0m[37m         [47m[37m [0m[37m  [47m[37m [0m[0m',
\ '',
\ '    Press <Alt>m for mappings menu, <Ctrl>p for command palette']
else
let g:startup_screen_lines = [
\ '    Press <Alt>m for mappings menu']
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

	setlocal modifiable modified
	silent execute "buffer" a:bufno
	silent execute ":%delete _"

	for line in range(centre[1])
	    call appendbufline(a:bufno, '$', '')
	endfor
	for line in g:startup_screen_lines
	    call appendbufline(a:bufno, '$', repeat(' ', centre[0]) . line)
	endfor

	setlocal nomodifiable nomodified
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
