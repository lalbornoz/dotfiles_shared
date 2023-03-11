"
" [Mappings] Leader key sequences and menu mappings
"

call AddMenu("Leader", 300)
call AddMapping("Leader", "Next buffer", "Go to next buffer in buffer list", '<silent>', '<Leader><Tab>', ':<C-U>bn<CR>')
call AddMapping("Leader", "Previous buffer", "Go to previous buffer in buffer list", '<silent>', '<Leader><S-Tab>', ':<C-U>bp<CR>')
call AddSeparator("Leader")
call AddMapping("Leader", "Show CtrlP hidden items", '', '<silent>', '<Leader>.', ':<C-U>let g:ctrlp_show_hidden = {n -> n ? 0 : 1}(g:ctrlp_show_hidden)<cr>')
call AddMapping("Leader", "Increase window width", "Increase current window width by 3", '<silent>', '<Leader>#', ':<C-U>vertical resize +3<CR>')
call AddMapping("Leader", "Scan CtrlP hidden items", "Toggle scanning for dotfiles and dotdirs in CtrlP", '<silent>', '<Leader>.', ':<C-U>let g:ctrlp_show_hidden = {n -> n ? 0 : 1}(g:ctrlp_show_hidden)<cr>')
call AddMapping("Leader", "Set mark x", "Set mark x at cursor position", '<silent>', '<Leader>:', 'mx')
call AddMapping("Leader", "Decrease window width", "Decrease current window width by 3", '<silent>', '<Leader>;', ':<C-U>vertical resize -3<CR>')
call AddMapping("Leader", "Execute register q", "Execute contents of register q", '<silent>', '<Leader>@', ':normal! @q<CR>')
call AddMapping("Leader", "Decrease window height", "Decrease current window height by 3", '<silent>', '<Leader>[', ':<C-U>resize -3<CR>')
call AddMapping("Leader", "Increase window height", "Increase current window height by 3", '<silent>', '<Leader>]', ':<C-U>resize +3<CR>')
call AddMapping("Leader", "Jump to mark x", "Jump to mark x in the current buffer", '<silent>', '<Leader>~', "'x")
call AddSeparator("Leader")
call AddMapping("Leader", "QuickFix window...", "Toggle the QuickFix window given recognised errors", '<silent>', '<Leader>c', ':<C-U>cwindow<CR>')
call AddMapping("Leader", "Open vim-crunch...", "Open vim-crunch prompt", '<silent>', '<Leader>C', ':<C-U>Crunch<CR>')
call AddMapping("Leader", "Insert date (LC_ALL=C)", '', '<silent>', '<Leader>d', ':<C-U>:r!env LC_ALL=C date<CR>')
call AddMapping("Leader", "Insert date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", '<silent>', '<Leader>D', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>')
call AddNMapping("Leader", "Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<Leader>f', ':FPC ')
call AddNMapping("Leader", "Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<Leader>f', ':FPCR ')
call AddMapping("Leader", "Read from program...", "Read from program prompt", '', '<Leader>F', ':<C-U>r!')
call AddMapping("Leader", "Toggle search match highlighting", '', '<silent>', '<Leader>h', ':<C-U>set invhlsearch<CR>')
call AddMapping("Leader", "Open C/C++ source module header", '', '<silent>', '<Leader>H', ':<C-U>COpenHeader<CR>')
call AddMapping("Leader", "Print Git diff", "Print global Git diff into new scratch window", '<silent>', '<Leader>i', ':<C-U>call ReadNewScratch("git diff", "git")<CR>\|zR')
call AddMapping("Leader", "Diff w/ horizontal split", "Diff against direct ancestors, split horizontally", '<silent>', '<Leader>I', ':<C-U>Ghdiffsplit<CR>')
call AddMapping("Leader", "Print Git log", "Print Git log into new scratch window", '<silent>', '<Leader>l', ':<C-U>call ReadNewScratch("git log", "git")<CR>')
call AddMapping("Leader", "Toggle case-sensitivity", '', '<silent>', '<Leader>n', ':<C-U>set invignorecase<CR>')
call AddMapping("Leader", "Convert to prototype", '', '<silent>', '<Leader>p', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>')
call AddMapping("Leader", "Redraw screen", '', '<silent>', '<Leader>r', ':<C-U>redraw<CR>')
call AddMapping("Leader", "Print git-status", "Bring up summary window akin to git-status", '<silent>', '<Leader>s', ':<C-U>Git<CR>')
call AddMapping("Leader", "Open terminal...", "Open a new terminal window", '<silent>', '<Leader>t', ':<C-U>terminal<CR>')
call AddMapping("Leader", "Open terminal tab...", "Open a new terminal tab", '', '<Leader>T', ':<C-U>tab terminal<CR>')
call AddSeparator("Leader")
call AddMapping("Leader", "Toggle line-wrap", "Toggle wrapping of lines longer than window width", '<silent>', '<Leader>w', ':<C-U>set invwrap<CR>')
call AddMapping("Leader", "Reset folding", '', '<silent>', '<Leader>x', ':<C-U>set foldmethod=marker<CR>')
call AddMapping("Leader", "Reset syntax highlighting", '', '<silent>', '<Leader>y', ':<C-U>syntax on<CR>')
call AddMapping("Leader", "Reload Vim configuration file", '', '<silent>', '<Leader>v', ':<C-U>source ~/.vimrc\|exec "set filetype=" . &filetype<CR>')
call AddMapping("Leader", "Edit Vim configuration...", "Edit Vim configuration file in new window", '<silent>', '<Leader>V', ':<C-U>tabnew\|e ~/.vimrc<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
