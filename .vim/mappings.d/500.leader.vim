"
" [Mappings] Leader key sequences and menu mappings
"

call AddMenu("Leader", 500)
call AddMapping("Leader", "Next buffer", "Go to next buffer in buffer list", '<silent>', '<Leader><Tab>', ':<C-U>bn<CR>')
call AddMapping("Leader", "Previous buffer", "Go to previous buffer in buffer list", '<silent>', '<Leader><S-Tab>', ':<C-U>bp<CR>')
call AddSeparator("Leader")
call AddMapping("Leader", "Set mark x", "Set mark x at cursor position", '<silent>', '<Leader>:', 'mx')
call AddMapping("Leader", "Execute register q", "Execute contents of register q", '<silent>', '<Leader>@', ':normal! @q<CR>')
call AddMapping("Leader", "Jump to mark x", "Jump to mark x in the current buffer", '<silent>', '<Leader>~', "'x")
call AddSeparator("Leader")
call AddMapping("Leader", "Insert date (LC_ALL=C)", '', '<silent>', '<Leader>d', ':<C-U>:r!env LC_ALL=C date<CR>')
call AddMapping("Leader", "Insert date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", '<silent>', '<Leader>D', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>')
call AddMapping("Leader", "Open C/C++ source module header", '', '<silent>', '<Leader>H', ':<C-U>COpenHeader<CR>')
call AddMapping("Leader", "Convert to prototype", '', '<silent>', '<Leader>p', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>')
call AddMapping("Leader", "Print git-status", "Bring up summary window akin to git-status", '<silent>', '<Leader>s', ':<C-U>Git<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
