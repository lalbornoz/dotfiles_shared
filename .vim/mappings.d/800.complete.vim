"
" [Mappings] LSP autocomplete {pseudo-,}mappings
"

"
" Fuck you Vim
"
if has('gui_running')
	inoremap <S-Tab>	<C-N>
else
	inoremap <Esc>[Z	<C-N>
endif

"inoremap <expr>    <CR>	pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"|	" Close LSP autocomplete window, if open
"inoremap <expr>   <Tab>	"\<Tab>"|							" Unbind <Tab> from LSP autocomplete (pseudo-mapping)
"inoremap <expr> <S-Tab>	pumvisible() ? "\<C-n>" : "\<S-Tab>"|				" Execute or advance LSP autocomplete

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
