"
" [Mappings] Key aliases (assuming XTerm-compatible terminal)
"

if !has('nvim') && !has('gui_running')

" {{{ <https://github.com/vim/vim/issues/9009>
" Enable modified arrow keys, see  :help xterm-modifier-keys
execute "silent! set <xUp>=\<Esc>[@;*A"
execute "silent! set <xDown>=\<Esc>[@;*B"
execute "silent! set <xRight>=\<Esc>[@;*C"
execute "silent! set <xLeft>=\<Esc>[@;*D"
" }}}
" {{{ Cursor keys w/ modifiers
map <Esc>[1;2A		<Shift><Up>
map <Esc>[1;2B		<Shift><Down>
map <Esc>[1;2C		<Shift><Right>
map <Esc>[1;2D		<Shift><Left>

map <Esc>[1;3A		<Alt><Up>
map <Esc>[1;3B		<Alt><Down>
map <Esc>[1;3C		<Alt><Right>
map <Esc>[1;3D		<Alt><Left>

map <Esc>[1;4A		<Alt><Shift><Up>
map <Esc>[1;4B		<Alt><Shift><Down>
map <Esc>[1;4C		<Alt><Shift><Right>
map <Esc>[1;4D		<Alt><Shift><Left>

map <Esc>[1;5A		<Ctrl><Up>
map <Esc>[1;5B		<Ctrl><Down>
map <Esc>[1;5C		<Ctrl><Right>
map <Esc>[1;5D		<Ctrl><Left>

map <Esc>[1;6A		<Ctrl><Shift><Up>
map <Esc>[1;6B		<Ctrl><Shift><Down>
map <Esc>[1;6C		<Ctrl><Shift><Right>
map <Esc>[1;6D		<Ctrl><Shift><Left>

map <Esc>[1;7A		<Ctrl><Alt><Up>
map <Esc>[1;7B		<Ctrl><Alt><Down>
map <Esc>[1;7C		<Ctrl><Alt><Right>
map <Esc>[1;7D		<Ctrl><Alt><Left>

map <Esc>[1;8A		<Ctrl><Alt><Shift><Up>
map <Esc>[1;8B		<Ctrl><Alt><Shift><Down>
map <Esc>[1;8C		<Ctrl><Alt><Shift><Right>
map <Esc>[1;8D		<Ctrl><Alt><Shift><Left>
" }}}

" {{{ Function key pseudo-mappings
map <Esc>[OP		<F1>
map <Esc>[OQ		<F2>
map <Esc>[OR		<F3>
map <Esc>[OS		<F4>
map <Esc>[15~		<F5>
map <Esc>[17~		<F6>
map <Esc>[18~		<F7>
map <Esc>[19~		<F8>
map <Esc>[20~		<F9>
map <Esc>[21~		<F10>
map <Esc>[23~		<F11>
map <Esc>[24~		<F12>
" }}}
" {{{ <Shift> function key pseudo-mappings
map <Esc>[1;2P		<S-F1>
map <Esc>[1;2Q		<S-F2>
map <Esc>[1;2R		<S-F3>
map <Esc>[1;2S		<S-F4>
map <Esc>[15;2~		<S-F5>
map <Esc>[17;2~		<S-F6>
map <Esc>[18;2~		<S-F7>
map <Esc>[19;2~		<S-F8>
map <Esc>[20;2~		<S-F9>
map <Esc>[21;2~		<S-F10>
map <Esc>[23;2~		<S-F11>
map <Esc>[24;2~		<S-F12>
" }}}
" {{{ <Alt> function key pseudo-mappings
map <Esc>[1;3P		<Alt><F1>
map <Esc>[1;3Q		<Alt><F2>
map <Esc>[1;3R		<Alt><F3>
map <Esc>[1;3S		<Alt><F4>
map <Esc>[15;3~		<Alt><F5>
map <Esc>[17;3~		<Alt><F6>
map <Esc>[18;3~		<Alt><F7>
map <Esc>[19;3~		<Alt><F8>
map <Esc>[20;3~		<Alt><F9>
map <Esc>[21;3~		<Alt><F10>
map <Esc>[23;3~		<Alt><F11>
map <Esc>[24;3~		<Alt><F12>
" }}}
" {{{ <Alt><Shift> function key pseudo-mappings
map <Esc>[1;4P		<Alt><Shift><F1>
map <Esc>[1;4Q		<Alt><Shift><F2>
map <Esc>[1;4R		<Alt><Shift><F3>
map <Esc>[1;4S		<Alt><Shift><F4>
map <Esc>[15;4~		<Alt><Shift><F5>
map <Esc>[17;4~		<Alt><Shift><F6>
map <Esc>[18;4~		<Alt><Shift><F7>
map <Esc>[19;4~		<Alt><Shift><F8>
map <Esc>[20;4~		<Alt><Shift><F9>
map <Esc>[21;4~		<Alt><Shift><F10>
map <Esc>[23;4~		<Alt><Shift><F11>
map <Esc>[24;4~		<Alt><Shift><F12>
" }}}
" {{{ <Ctrl> function key pseudo-mappings
map <Esc>[1;5P		<Ctrl><F1>
map <Esc>[1;5Q		<Ctrl><F2>
map <Esc>[1;5R		<Ctrl><F3>
map <Esc>[1;5S		<Ctrl><F4>
map <Esc>[15;5~		<Ctrl><F5>
map <Esc>[17;5~		<Ctrl><F6>
map <Esc>[18;5~		<Ctrl><F7>
map <Esc>[19;5~		<Ctrl><F8>
map <Esc>[20;5~		<Ctrl><F9>
map <Esc>[21;5~		<Ctrl><F10>
map <Esc>[23;5~		<Ctrl><F11>
map <Esc>[24;5~		<Ctrl><F12>
" }}}
" {{{ <Ctrl><Shift> function key pseudo-mappings
map <Esc>[1;6P		<Ctrl><Shift><F1>
map <Esc>[1;6Q		<Ctrl><Shift><F2>
map <Esc>[1;6R		<Ctrl><Shift><F3>
map <Esc>[1;6S		<Ctrl><Shift><F4>
map <Esc>[15;6~		<Ctrl><Shift><F5>
map <Esc>[17;6~		<Ctrl><Shift><F6>
map <Esc>[18;6~		<Ctrl><Shift><F7>
map <Esc>[19;6~		<Ctrl><Shift><F8>
map <Esc>[20;6~		<Ctrl><Shift><F9>
map <Esc>[21;6~		<Ctrl><Shift><F10>
map <Esc>[23;6~		<Ctrl><Shift><F11>
map <Esc>[24;6~		<Ctrl><Shift><F12>
" }}}

endif

if has('nvim')
	imap <S-Del> <Del>
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
