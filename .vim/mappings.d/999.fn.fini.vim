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
let g:menus["<Fn>"]["items"] = []
let key_last = 0

for item in menu_items
	let key_cur = str2nr(matchstr(item["lhs"], '^<\([MCS]-\)*F\zs[0-9]\+\ze'))
	if key_last == 0
		let key_last = key_cur
	elseif (key_cur != key_last) && (((key_cur - 1) % 4) == 0)
		let key_last = key_cur
		call roarie_menu#AddSeparator("<Fn>")
	endif
	let g:menus["<Fn>"]["items"] += [item]
endfor

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
