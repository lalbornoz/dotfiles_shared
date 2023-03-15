"
" [AutoCmds] Neovim
"

if has('nvim')

" <https://github.com/neovim/neovim/issues/14986>
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

" <https://vi.stackexchange.com/questions/3670/how-to-enter-insert-mode-when-entering-neovim-terminal-pane>
autocmd BufWinEnter,WinEnter term://* startinsert

endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
