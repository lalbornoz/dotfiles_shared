"
" Menu commands
"

let g:menus = {}

" {{{ fun! AddMapping_(menu, title, type, descr, silent, lhs, rhs)
fun! AddMapping_(menu, title, type, descr, silent, lhs, rhs)
	let l:map_line = [a:type]

	if len(a:silent) > 0
		let l:map_line += ['<silent>']
	endif
	if len(a:descr) == 0
		let l:descr = a:title
	else
		let l:descr = a:descr
	endif
	let g:menus[a:menu] += [{
		\ 'descr': l:descr,
		\ 'lhs': a:lhs,
		\ 'rhs': a:rhs,
		\ 'silent': a:silent,
		\ 'title': a:title,
		\ }]
	let l:map_line += [a:lhs, a:rhs]
	execute join(l:map_line, ' ')
endfun
" }}}

" {{{ fun! AddMapping(menu, title, descr, silent, lhs, rhs)
fun! AddMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(a:menu, a:title, 'noremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddIMapping(menu, title, descr, silent, lhs, rhs)
fun! AddIMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(a:menu, a:title, 'inoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddNMapping(menu, title, descr, silent, lhs, rhs)
fun! AddNMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(a:menu, a:title, 'nnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddTMapping(menu, title, descr, silent, lhs, rhs)
fun! AddTMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(a:menu, a:title, 'tnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddVMapping(menu, title, descr, silent, lhs, rhs)
fun! AddVMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(a:menu, a:title, 'vnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddMenu(title)
fun! AddMenu(title)
	let g:menus[a:title] = []
endfun
" }}}
" {{{ fun! AddSeparator(menu)
fun! AddSeparator(menu)
	let g:menus[a:menu] += [{
		\ 'descr': '',
		\ 'lhs': '',
		\ 'rhs': '',
		\ 'silent': '',
		\ 'title': '--',
		\ }]
endfun
" }}}
" {{{ fun! InstallMenus()
fun! InstallMenus()
	call quickui#menu#reset()
	for l:menu in keys(g:menus)
		let l:menu_items = []
		for l:menu_item in g:menus[l:menu]
			let l:keys = l:menu_item['lhs']
			let l:keys = substitute(l:keys, '<Leader>', g:mapleader, '')
			let l:keys = substitute(l:keys, '<', '\\<', '')
			let l:title = l:menu_item['title']
			if l:title != "--"
				let l:title .= "\t". l:menu_item['lhs']
			endif
			let l:menu_items += [[l:title, ':call feedkeys("'. l:keys .'")', '']]
		endfor
		call quickui#menu#install(l:menu, l:menu_items, 10000)
	endfor
endfun
" }}}

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
