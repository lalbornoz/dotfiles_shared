"
" [Mappings] <Alt> key sequences and menu mappings
"

call AddMenu("<Alt>", 550)
call AddMapping("<Alt>", "Set mark x", "Set mark x at cursor position", '<silent>', '<Alt>:', 'mx')
call AddMapping("<Alt>", "Execute register q", "Execute contents of register q", '<silent>', '<Alt>@', ':normal! @q<CR>')
call AddMapping("<Alt>", "Jump to mark x", "Jump to mark x in the current buffer", '<silent>', '<Alt>~', "'x")
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Insert date (LC_ALL=C)", '', '<silent>', '<Alt>d', ':<C-U>:r!env LC_ALL=C date<CR>')
call AddMapping("<Alt>", "Insert date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", '<silent>', '<Alt>D', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Toggle foldmethod", 'Toggle between foldmethod=marker and foldmethod=indent', '<silent>', '<Alt>f', ':<C-U>ToggleFoldMethod<CR>')
call AddMapping("<Alt>", "Toggle search match highlighting", '', '<silent>', '<Alt>h', ':<C-U>set invhlsearch<CR>')
call AddMapping("<Alt>", "Toggle case-sensitivity", '', '<silent>', '<Alt>n', ':<C-U>set invignorecase<CR>')
call AddMapping("<Alt>", "Set filetype=terminal", '', '<silent>', '<Alt>r', ':<C-U>set filetype=terminal<CR>')
call AddMapping("<Alt>", "Toggle line-wrap", "Toggle wrapping of lines longer than window width", '<silent>', '<Alt>w', ':<C-U>set invwrap<CR>')
call AddMapping("<Alt>", "Reset folding", '', '<silent>', '<Alt>x', ':<C-U>set foldmethod=marker<CR>')
call AddMapping("<Alt>", "Reset syntax highlighting", '', '<silent>', '<Alt>y', ':<C-U>syntax on<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Open C/C++ source module header", '', '<silent>', '<Alt>H', ':<C-U>COpenHeader<CR>')
call AddMapping("<Alt>", "Convert to prototype", '', '<silent>', '<Alt>p', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Diff w/ horizontal split", "Diff against direct ancestors, split horizontally", '<silent>', '<Alt>I', ':<C-U>Ghdiffsplit<CR>')
call AddMapping("<Alt>", "Print Git diff", "Print global Git diff into new scratch window", '<silent>', '<Alt>i', ':<C-U>call ReadNewScratch("git diff", "git")<CR>\|zR')
call AddMapping("<Alt>", "Print Git log", "Print Git log into new scratch window", '<silent>', '<Alt>l', ':<C-U>call ReadNewScratch("git log", "git")<CR>')
call AddMapping("<Alt>", "Print Git status", "Bring up summary window akin to git-status", '<silent>', '<Alt>s', ':<C-U>Git<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Edit Vim configuration...", "Edit Vim configuration file in new window", '<silent>', '<Alt>V', ':<C-U>tabnew\|e ~/.vimrc<CR>')
call AddMapping("<Alt>", "Reload Vim configuration file", '', '<silent>', '<Alt>v', ':<C-U>source ~/.vimrc\|exec "set filetype=" . &filetype<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
