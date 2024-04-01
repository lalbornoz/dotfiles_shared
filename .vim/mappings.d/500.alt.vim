"
" [Mappings] <M- >key sequences and menu mappings
"

call roarie_menu#AddMenu("<Alt>", 600)
call roarie_menu#AddMapping("<Alt>", "Set mark x", "Set mark x at cursor position", "<silent>", '<M-:>', 'mx')
call roarie_menu#AddMapping("<Alt>", "Execute register q", "Execute contents of register q", "<silent>", '<M-@>', ':normal! @q<CR>')
call roarie_menu#AddMapping("<Alt>", "Jump to mark x", "Jump to mark x in the current buffer", "<silent>", '<M-~>', "'x")
call roarie_menu#AddMapping("<Alt>", "Open C/C++ source module header", "Open C/C++ source module header", '<silent>', '<M-H>', ':<C-U>COpenHeader<CR>')
call roarie_menu#AddMapping("<Alt>", "Edit file under cursor", "Edit the file whose name is under or after the cursor", '<silent>', '<M-J>', 'gf<CR>')
call roarie_menu#AddSeparator("<Alt>")
call roarie_menu#AddMapping("<Alt>", "Decrement number", "Decrement number under cursor", '<silent>', '<M-->', '<C-X>')
call roarie_menu#AddMapping("<Alt>", "Increment number", "Increment number under cursor", '<silent>', '<M-=>', '<C-A>')
call roarie_menu#AddMapping("<Alt>", "Invert case of word", "Invert case of word under cursor", '<silent>', '<M-c>', 'g~w')
call roarie_menu#AddMapping("<Alt>", "Invert case of line", "Invert case of line under cursor", '<silent>', '<M-C>', 'g~~')
call roarie_menu#AddMapping("<Alt>", "Insert date (LC_ALL=C)", "Insert date (LC_ALL=C)", '<silent>', '<M-d>', ':<C-U>:r!env LC_ALL=C date<CR>')
call roarie_menu#AddMapping("<Alt>", "Insert date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", "<silent>", '<M-D>', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>')
call roarie_menu#AddMapping("<Alt>", "Convert to prototype", "Convert to prototype", '<silent>', '<M-p>', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>')
call roarie_menu#AddSeparator("<Alt>")
call roarie_menu#AddMapping("<Alt>", "Enable bidirectionality", "Enable bidirectionality", '<silent>', '<M-b>', ':<C-U>BidiEnable<CR>:KeyboardAutoEnable<CR>')
call roarie_menu#AddMapping("<Alt>", "Disable bidirectionality", "Disable bidirectionality", '<silent>', '<M-B>', ':<C-U>BidiDisable<CR>:KeyboardAutoDisable<CR>')
call roarie_menu#AddMapping("<Alt>", "Toggle foldmethod", "Toggle between foldmethod=marker and foldmethod=indent", '<silent>', '<M-f>', ':<C-U>ToggleFoldMethod<CR>')
call roarie_menu#AddMapping("<Alt>", "Toggle search match highlighting", "Toggle search match highlighting", '<silent>', '<M-h>', ':<C-U>set invhlsearch<CR>')
call roarie_menu#AddMapping("<Alt>", "Toggle case-sensitivity", "Toggle case-sensitivity", '<silent>', '<M-n>', ':<C-U>set invignorecase<CR>')
call roarie_menu#AddMapping("<Alt>", "Set filetype=terminal", "Set filetype=terminal", '<silent>', '<M-r>', ':<C-U>set filetype=terminal<CR>')
call roarie_menu#AddSeparator("<Alt>")
call roarie_menu#AddMapping("<Alt>", "Reload Vim configuration file", "Reload Vim configuration file", '<silent>', '<M-v>', ':<C-U>source ~/.vimrc\|exec "set filetype=" . &filetype<CR>')
call roarie_menu#AddMapping("<Alt>", "Edit Vim configuration...", "Edit Vim configuration file in new window", "<silent>", '<M-V>', ':<C-U>tabnew\|e ~/.vimrc<CR>')
call roarie_menu#AddMapping("<Alt>", "Toggle line-wrap", "Toggle wrapping of lines longer than window width", "<silent>", '<M-w>', ':<C-U>set invwrap<CR>')
call roarie_menu#AddMapping("<Alt>", "Set tw=0", "Set textwidth to 0", "<silent>", '<M-W>', ':<C-U>set tw=0<CR>')
call roarie_menu#AddMapping("<Alt>", "Reset folding", "Reset folding", '<silent>', '<M-x>', ':<C-U>set foldmethod=marker<CR>')
if has('nvim')
call roarie_menu#AddMapping("<Alt>", "Toggle hex editing", "Toggle hex editing", '<silent>', '<M-X>', ':<C-U>Hexmode<CR>')
endif
call roarie_menu#AddMapping("<Alt>", "Reset syntax highlighting", "Reset syntax highlighting", '<silent>', '<M-y>', ':<C-U>syntax on<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
