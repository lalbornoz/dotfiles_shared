"
" [AutoCmds] VimEnterStartupScreen
"

fun! VESSAppendBufCentred(lines)
	let buf_w = winwidth(0)
	let buf_h = winheight(0)

	let lines_w = 0
	let lines_h = len(a:lines)

	for line in a:lines
		let line_ = substitute(line, '\[[0-9]\+m', "", "g")
		let line_w = strchars(line_)
		if line_w > lines_w
			let lines_w = line_w
		endif
	endfor

	let center_w = (buf_w - lines_w) / 2
	let center_h = (buf_h - lines_h) / 2

	for line in range(center_h)
	    call append('$', '')
	endfor

	for line in a:lines
	    call append('$', repeat(' ', center_w) . line)
	endfor
endfun

" <https://vi.stackexchange.com/questions/627/how-can-i-change-vims-start-or-intro-screen>
fun! VimEnterStartupScreen()
	" Don't run if: we have commandline arguments, we don't have an empty
	" buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
		return
	endif

	" Start a new buffer ...
	enew

	" ... and set some options for it
	setlocal
		\ bufhidden=wipe
		\ buftype=nofile
		\ nobuflisted
		\ nocursorcolumn
		\ nocursorline
		\ nolist
		\ nonumber
		\ noswapfile
		\ norelativenumber

	" {{{ let lines = [...]
	let lines = [
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
	" }}}

	"
	" Now we can just write to the buffer, whatever you want.
	"
	call VESSAppendBufCentred(lines)
	setlocal ft=terminal

	" No modifications to this buffer
	setlocal nomodifiable nomodified

	" When we go to insert mode start a new buffer, and start insert
	nnoremap <buffer><silent> e :enew<CR>
	nnoremap <buffer><silent> h :enew<CR>
	nnoremap <buffer><silent> j :enew<CR>
	nnoremap <buffer><silent> k :enew<CR>
	nnoremap <buffer><silent> l :enew<CR>
	nnoremap <buffer><silent> <Left> :enew<CR>
	nnoremap <buffer><silent> <Down> :enew<CR>
	nnoremap <buffer><silent> <Up> :enew<CR>
	nnoremap <buffer><silent> <Right> :enew<CR>
	nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
	nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call VimEnterStartupScreen()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
