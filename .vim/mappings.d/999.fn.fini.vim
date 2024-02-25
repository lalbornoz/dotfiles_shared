"
" [Mappings] <Fn> key menu mappings pseudo-menu
"

let s:mod_order = [
\ '',
\ 'S-',
\ 'C-',
\ 'C-S-',
\ 'M-',
\ 'M-S-',
\ 'M-C-',
\ 'M-C-S-',
\ ]

" {{{ fun! PopulateFnMenu()
fun! PopulateFnMenu(src_items, dst_title, key_to, sep_each)
	let item_idx = 0
	let key_last = 0

	for item_idx in range(len(a:src_items))
		let item = a:src_items[item_idx]
		let key_cur = str2nr(matchstr(item["lhs"], '^<\([MCS]-\)*F\zs[0-9]\+\ze'))

		if key_cur > a:key_to
			break
		else
			if key_last == 0
				let key_last = key_cur
			elseif (key_cur != key_last) && (((key_cur - 1) % a:sep_each) == 0)
				let key_last = key_cur
				call roarie_menu#AddSeparator(a:dst_title)
			endif
			let g:menus[a:dst_title]["items"] += [item]
		endif
	endfor

	if item_idx > 0
		unlet a:src_items[:item_idx]
	endif
	return a:src_items
endfun
" }}}
" {{{ fun! SortFnMenu(lhs, rhs)
fun! SortFnMenu(lhs, rhs)
	let lhs_key = str2nr(matchstr(a:lhs["lhs"], '^<\([MCS]-\)*F\zs[0-9]\+\ze'))
	let rhs_key = str2nr(matchstr(a:rhs["lhs"], '^<\([MCS]-\)*F\zs[0-9]\+\ze'))
	if lhs_key < rhs_key
		return -1
	elseif lhs_key > rhs_key
		return 1
	else
		let lhs_mod = matchstr(a:lhs["lhs"], '^<\zs\([MCS-]\)*\ze')
		let lhs_priority = index(s:mod_order, lhs_mod)
		let rhs_mod = matchstr(a:rhs["lhs"], '^<\zs\([MCS-]\)*\ze')
		let rhs_priority = index(s:mod_order, rhs_mod)
		if lhs_priority < rhs_priority
			return -1
		elseif lhs_priority > rhs_priority
			return 1
		else
			return 0
		endif
	endif
endfun
" }}}

let menu_items = sort(g:menus["<Fn>"]["items"], function("SortFnMenu"))
unlet g:menus["<Fn>"]
call roarie_menu#AddMenu("<F1-8>", 100, 1)
let menu_items = PopulateFnMenu(menu_items, "<F1-8>", 8, 4)
call roarie_menu#AddMenu("<F9-12>", 150, 1)
let menu_items = PopulateFnMenu(menu_items, "<F9-12>", 12, 2)

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
