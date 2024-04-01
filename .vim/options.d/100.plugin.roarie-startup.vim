let g:roarie_startup_hl_groups = [
	\ ["Button",		"gui=bold",		"guifg=black",		"guibg=#7acaca"],
	\ ["Button",					"ctermfg=black",	"ctermbg=darkcyan"],
	\ ["ButtonFrame",	"gui=bold",		"guifg=#7acaca"],
	\ ["ButtonFrame",				"ctermfg=darkcyan"],
	\ ["ButtonRhs",		"gui=underline",	"guifg=black",		"guibg=#7acaca"],
	\ ["ButtonRhs",		"cterm=underline",	"ctermfg=black",	"ctermbg=darkcyan"],
	\ ]

let g:roarie_startup_hl_matches = [
	\ ["Button",		'\zs.*\ze'],
	\ ["ButtonFrame",	'[]'],
	\ ["ButtonRhs",		'.*<\zs.*\ze>.*'],
	\ ]

if has("nvim")

let g:roarie_startup_screen_lines = [
	\ '   [40m[37m              [40m[34m▃▃▃▃[0m',
	\ '   [40m[37m           [40m[34m▟[44m[94m        [40m[34m▙[0m',
	\ '   [40m[35m▟▙▃▟▙      [44m[34m [44m[33m/\[34m[34m    [34m[33m/\[34m[34m [40m[37m   [40m[97mroar![0m',
	\ '   [40m[35m▜[40m[95m▒▓▒[40m[35m▛      [104m[94m  [103m[94m▛ [103m[33m""" [103m[94m▜[104m[34m [40m[37m  [40m[97m/[0m',
	\ '   [40m[37m [40m[35m▜[45m[35m [40m[35m▛       [104m[94m [103m[30m  ^ _ ^ [104m[94m [40m[37m [40m[97m/[0m',
	\ '   [40m[37m  [40m[35m▀        [46m[36m [103m[33m (__[103m[30my[103m[33m_)[103m[30m [46m[36m [0m',
	\ '   [40m[37m [40m[93m▟▙    ▁▂▃▟[103m[36m▐[40m[36m▙[40m[93m▜[103m[33m`\_/[40m[93m▛[40m[36m▟▌[0m',
	\ '   [40m[37m [40m[93m▟▙   ▟[103m[30m    [103m[36m▓▓▓[103m[30m| |[40m[93m▍[40m[36m▓▓▓[0m',
	\ '   [40m[37m [40m[93m▜[103m[30m\[40m[93m▙ ▟[103m[30m    [103m[36m▓▓▓▓▓[103m[30m |[40m[36m▓▓▓▓▓[0m',
	\ '   [40m[37m  [40m[93m▜[103m[30m\\roa \ [103m[36m▒▒▒[103m[30m|[103m[33m [103m[30m|[40m[37m [40m[36m▒▒▒[0m',
	\ '   [40m[37m   [40m[93m▜[103m[30m\ rie ) [103m[36m▒[103m[30m_|[103m[33m [103m[30m|[40m[93m▙ [40m[36m▒[0m',
	\ '   [40m[37m   [103m[30m([4m     /  ))))))[0m',
	\ '   Mappings menu   <ALT-M>  ',
	\ '   Command palette <CTRL-P> ',
	\ ]

else

let g:roarie_startup_screen_lines = [
	\ '   Mappings menu   <ALT-M>  ',
	\ '   Command palette <CTRL-P> ',
	\ ]

endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
