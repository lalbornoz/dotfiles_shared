"
" Menu commands
"

let g:menus = {}

" {{{ fun! AddMapping_(noaddfl, menu, title, type, descr, silent, lhs, rhs)
fun! AddMapping_(noaddfl, menu, title, type, descr, silent, lhs, rhs)
	let l:map_line = [a:type]

	let lhs_map = a:lhs
	if has('gui_running')
		let lhs_map = substitute(lhs_map, '^<Alt>\([a-z0-9]\)$', '<M-\1>', 'g')

		let lhs_map = substitute(lhs_map, '^<Alt><Shift><\(Down\|Left\|Right\|Up\)>$', '<M-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Alt><S-\(Down\|Left\|Right\|Up\)>$', '<M-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Alt><\(Down\|Left\|Right\|Up\)>$', '<M-\1>', 'g')

		let lhs_map = substitute(lhs_map, '^<Alt><Shift><\(F[0-9]\+\)>$', '<M-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Alt><S-\(F[0-9]\+\)>$', '<M-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Alt><\(F[0-9]\+\)>$', '<M-\1>', 'g')

		let lhs_map = substitute(lhs_map, '^<Ctrl><Shift><\(Down\|Left\|Right\|Up\)>$', '<C-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Ctrl><S-\(Down\|Left\|Right\|Up\)>$', '<C-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Ctrl><\(Down\|Left\|Right\|Up\)>$', '<C-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Ctrl><Alt><Shift><\(Down\|Left\|Right\|Up\)>$', '<M-C-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Ctrl><Alt><S-\(Down\|Left\|Right\|Up\)>$', '<M-C-S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<Ctrl><Alt><\(Down\|Left\|Right\|Up\)>$', '<M-C-\1>', 'g')

		let lhs_map = substitute(lhs_map, '^<Shift><\(Down\|Left\|Right\|Up\)>$', '<S-\1>', 'g')
		let lhs_map = substitute(lhs_map, '^<S-\(Down\|Left\|Right\|Up\)>$', '<S-\1>', 'g')
	endif

	if len(a:silent) > 0
		let l:map_line += ['<silent>']
	endif
	if len(a:descr) == 0
		let l:descr = a:title
	else
		let l:descr = a:descr
	endif

	if a:noaddfl == 0
		let g:menus[a:menu]['items'] += [{
			\ 'descr': l:descr,
			\ 'lhs': a:lhs,
			\ 'rhs': a:rhs,
			\ 'silent': a:silent,
			\ 'title': a:title,
			\ }]
	endif

	let l:map_line += [lhs_map, a:rhs]
	execute join(l:map_line, ' ')
endfun
" }}}

" {{{ fun! AddMapping(menu, title, descr, silent, lhs, rhs)
fun! AddMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(0, a:menu, a:title, 'noremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddIMapping(menu, title, descr, silent, lhs, rhs)
fun! AddIMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(0, a:menu, a:title, 'inoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddINVOMapping(menu, title, descr, silent, lhs, rhs)
fun! AddINVOMapping(menu, title, descr, silent, lhs, rhs)
	call AddMapping_(0, a:menu, a:title, 'noremap', a:descr, a:silent, a:lhs, a:rhs)
	return AddMapping_(1, a:menu, a:title, 'inoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddNMapping(menu, title, descr, silent, lhs, rhs)
fun! AddNMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(0, a:menu, a:title, 'nnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddTMapping(menu, title, descr, silent, lhs, rhs)
fun! AddTMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(0, a:menu, a:title, 'tnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddVMapping(menu, title, descr, silent, lhs, rhs)
fun! AddVMapping(menu, title, descr, silent, lhs, rhs)
	return AddMapping_(0, a:menu, a:title, 'vnoremap', a:descr, a:silent, a:lhs, a:rhs)
endfun
" }}}
" {{{ fun! AddMenu(title, priority)
fun! AddMenu(title, priority)
	let g:menus[a:title] = {}
	let g:menus[a:title]['items'] = []
	let g:menus[a:title]['priority'] = a:priority
endfun
" }}}
" {{{ fun! AddSeparator(menu)
fun! AddSeparator(menu)
	let g:menus[a:menu]['items'] += [{
		\ 'descr': '',
		\ 'lhs': '',
		\ 'rhs': '',
		\ 'silent': '',
		\ 'title': '--',
		\ }]
endfun
" }}}
" {{{ fun! SortMenus(lhs, rhs)
fun! SortMenus(lhs, rhs)
  let lhs_item = g:menus[a:lhs]
  let rhs_item = g:menus[a:rhs]
  if lhs_item['priority'] < rhs_item['priority']
    return -1
  elseif lhs_item['priority'] > rhs_item['priority']
    return 1
  else
    return 0
  endif
endfun
" }}}
" {{{ fun! InstallMenus()
fun! InstallMenus()
	call quickui#menu#reset()
	let menu_keys = sort(keys(g:menus), function("SortMenus"))
	for l:menu in menu_keys
		let l:menu_items = []
		for l:menu_item in g:menus[l:menu]['items']
			let l:keys = l:menu_item['lhs']
			let l:keys = substitute(l:keys, '<Leader>', g:mapleader, '')
			let l:keys = substitute(l:keys, '<', '\\<', '')
			let l:title = l:menu_item['title']
			if l:title != "--"
				let l:title .= "\t". l:menu_item['lhs']
			endif
			let l:menu_items += [[l:title, ':call feedkeys("'. l:keys .'")', '']]
		endfor
		call quickui#menu#install(l:menu, l:menu_items, g:menus[l:menu]['priority'])
	endfor
endfun
" }}}

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
