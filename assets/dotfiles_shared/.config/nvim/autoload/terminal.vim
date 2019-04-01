" <https://www.reddit.com/r/neovim/comments/7r85hs/how_do_i_toggle_terminal_window/>
function! terminal#ChooseTerm(termname, slider)
	let pane = bufwinnr(a:termname)
	let buf = bufexists(a:termname)
	if pane > 0
		" pane is visible
		if a:slider > 0
			:exe pane . "wincmd c"
		else
			:exe "e #" 
		endif
	elseif buf > 0
		" buffer is not in pane
		if a:slider
			:exe "topleft split"
		endif
		:exe "buffer " . a:termname
	else
		" buffer is not loaded, create
		if a:slider
			:exe "topleft split"
		endif
		:terminal
		:exe "f " a:termname
	endif
endfunction
