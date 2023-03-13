"
" [Mappings] <Alt> key sequences and menu mappings
"

call AddMenu("<Alt>", 550)
call AddMapping("<Alt>", "Open QuickUI menu", '', '<silent>', '<Alt>m', ':<C-U>call quickui#menu#open()<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Diff w/ horizontal split", "Diff against direct ancestors, split horizontally", '<silent>', '<Alt>I', ':<C-U>Ghdiffsplit<CR>')
call AddMapping("<Alt>", "Print Git diff", "Print global Git diff into new scratch window", '<silent>', '<Alt>i', ':<C-U>call ReadNewScratch("git diff", "git")<CR>\|zR')
call AddMapping("<Alt>", "Print Git log", "Print Git log into new scratch window", '<silent>', '<Alt>l', ':<C-U>call ReadNewScratch("git log", "git")<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Edit Vim configuration...", "Edit Vim configuration file in new window", '<silent>', '<Alt>V', ':<C-U>tabnew\|e ~/.vimrc<CR>')
call AddMapping("<Alt>", "Reload Vim configuration file", '', '<silent>', '<Alt>v', ':<C-U>source ~/.vimrc\|exec "set filetype=" . &filetype<CR>')
call AddMapping("<Alt>", "Reset syntax highlighting", '', '<silent>', '<Alt>y', ':<C-U>syntax on<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Toggle foldmethod", 'Toggle between foldmethod=marker and foldmethod=indent', '<silent>', '<Alt>f', ':<C-U>ToggleFoldMethod<CR>')
call AddMapping("<Alt>", "Reset folding", '', '<silent>', '<Alt>x', ':<C-U>set foldmethod=marker<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Increase window width", "Increase current window width by 3", '<silent>', '<Alt><', ':<C-U>vertical resize +3<CR>')
call AddMapping("<Alt>", "Decrease window width", "Decrease current window width by 3", '<silent>', '<Alt>>', ':<C-U>vertical resize -3<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Toggle case-sensitivity", '', '<silent>', '<Alt>n', ':<C-U>set invignorecase<CR>')
call AddMapping("<Alt>", "Toggle line-wrap", "Toggle wrapping of lines longer than window width", '<silent>', '<Alt>w', ':<C-U>set invwrap<CR>')
call AddMapping("<Alt>", "Toggle search match highlighting", '', '<silent>', '<Alt>h', ':<C-U>set invhlsearch<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
