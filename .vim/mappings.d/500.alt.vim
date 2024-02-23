"
" [Mappings] <M- >key sequences and menu mappings
"

call AddMenu("<Alt>", 500)
call AddMapping("<Alt>", "Set mark x", "Set mark x at cursor position", "<silent>", '<M-:>', 'mx')
call AddMapping("<Alt>", "Execute register q", "Execute contents of register q", "<silent>", '<M-@>', ':normal! @q<CR>')
call AddMapping("<Alt>", "Jump to mark x", "Jump to mark x in the current buffer", "<silent>", '<M-~>', "'x")
call AddMapping("<Alt>", "Open C/C++ source module header", "Open C/C++ source module header", '<silent>', '<M-H>', ':<C-U>COpenHeader<CR>')
call AddMapping("<Alt>", "Edit file under cursor", "Edit the file whose name is under or after the cursor", '<silent>', '<M-J>', 'gf<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Decrement number", "Decrement number under cursor", '<silent>', '<M-->', '<C-X>')
call AddMapping("<Alt>", "Increment number", "Increment number under cursor", '<silent>', '<M-=>', '<C-A>')
call AddMapping("<Alt>", "Invert case of word", "Invert case of word under cursor", '<silent>', '<M-c>', 'g~w')
call AddMapping("<Alt>", "Invert case of line", "Invert case of line under cursor", '<silent>', '<M-C>', 'g~~')
call AddMapping("<Alt>", "Insert date (LC_ALL=C)", "Insert date (LC_ALL=C)", '<silent>', '<M-d>', ':<C-U>:r!env LC_ALL=C date<CR>')
call AddMapping("<Alt>", "Insert date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", "<silent>", '<M-D>', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>')
call AddMapping("<Alt>", "Convert to prototype", "Convert to prototype", '<silent>', '<M-p>', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Enable bidirectionality", "Enable bidirectionality", '<silent>', '<M-b>', ':<C-U>BidiEnable<CR>:KeyboardAutoEnable<CR>')
call AddMapping("<Alt>", "Disable bidirectionality", "Disable bidirectionality", '<silent>', '<M-B>', ':<C-U>BidiDisable<CR>:KeyboardAutoDisable<CR>')
call AddMapping("<Alt>", "Toggle foldmethod", "Toggle between foldmethod=marker and foldmethod=indent", '<silent>', '<M-f>', ':<C-U>ToggleFoldMethod<CR>')
call AddMapping("<Alt>", "Toggle search match highlighting", "Toggle search match highlighting", '<silent>', '<M-h>', ':<C-U>set invhlsearch<CR>')
call AddMapping("<Alt>", "Toggle case-sensitivity", "Toggle case-sensitivity", '<silent>', '<M-n>', ':<C-U>set invignorecase<CR>')
call AddMapping("<Alt>", "Set filetype=terminal", "Set filetype=terminal", '<silent>', '<M-r>', ':<C-U>set filetype=terminal<CR>')
call AddSeparator("<Alt>")
if has('nvim')
call AddMapping("<Alt>", "Telescope git_files...", "Telescope git_files...", "<silent>", '<M-g>', ':lua require("telescope").extensions.menufacture.git_files()<CR>')
endif
call AddMapping("<Alt>", "Diff w/ horizontal split", "Diff against direct ancestors, split horizontally", "<silent>", '<M-I>', ':<C-U>Ghdiffsplit<CR>')
call AddMapping("<Alt>", "Print Git diff", "Print global Git diff into new scratch window", "<silent>", '<M-i>', ':<C-U>call ReadNewScratch("git diff", "git")<CR>\|zR')
call AddMapping("<Alt>", "Print Git log", "Print Git log into new scratch window", "<silent>", '<M-l>', ':<C-U>call ReadNewScratch("git log", "git")<CR>')
if has('nvim')
call AddMapping("<Alt>", "Telescope git_commits...", "Telescope git_commits...", "<silent>", '<M-L>', ':Telescope git_commits<CR>')
endif
call AddMapping("<Alt>", "Print Git status", "Bring up summary window akin to git-status", "<silent>", '<M-s>', ':<C-U>Git<CR>')
call AddSeparator("<Alt>")
call AddMapping("<Alt>", "Reload Vim configuration file", "Reload Vim configuration file", '<silent>', '<M-v>', ':<C-U>source ~/.vimrc\|exec "set filetype=" . &filetype<CR>')
call AddMapping("<Alt>", "Edit Vim configuration...", "Edit Vim configuration file in new window", "<silent>", '<M-V>', ':<C-U>tabnew\|e ~/.vimrc<CR>')
call AddMapping("<Alt>", "Toggle line-wrap", "Toggle wrapping of lines longer than window width", "<silent>", '<M-w>', ':<C-U>set invwrap<CR>')
call AddMapping("<Alt>", "Set tw=0", "Set textwidth to 0", "<silent>", '<M-W>', ':<C-U>set tw=0<CR>')
call AddMapping("<Alt>", "Reset folding", "Reset folding", '<silent>', '<M-x>', ':<C-U>set foldmethod=marker<CR>')
if has('nvim')
call AddMapping("<Alt>", "Toggle hex editing", "Toggle hex editing", '<silent>', '<M-X>', ':<C-U>Hexmode<CR>')
endif
call AddMapping("<Alt>", "Reset syntax highlighting", "Reset syntax highlighting", '<silent>', '<M-y>', ':<C-U>syntax on<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
