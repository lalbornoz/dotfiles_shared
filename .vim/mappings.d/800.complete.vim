"
" [Mappings] Autocomplete mappings
"

if has('nvim')
	" Execute or advance nvim-cmp
	inoremap <S-Tab> <Cmd>lua require('cmp').complete()<CR>
else
	" Execute or advance {ins-completion,compl-omni}
	autocmd BufEnter *
		\ if len(&omnifunc) == 0 |
		\	inoremap <expr> <S-Tab>	pumvisible() ? "\<C-n>" : "\<C-X>\<C-N>" |
		\ else |
		\	inoremap <expr> <S-Tab>	pumvisible() ? "\<C-n>" : "\<C-X>\<C-O>" |
		\ endif
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
