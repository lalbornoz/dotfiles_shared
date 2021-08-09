"
" [Mappings] File menu mappings
"

call AddMenu("File")
call AddMapping("File", "Display manual page...", '', '', '<F9>', ':<C-U>Man ')
call AddMapping("File", "Display manual page", "Display manual page from current word", '<silent>', '<S-F9>', '"zyiw:exe "Man ".@z.""<CR>')
call AddMapping("File", "Search filesystem...", '', '', '<F10>', ':<C-U>Fsgrep /')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<S-F10>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
call AddMapping("File", "Toggle Buffergator", "Toggle Buffergator window", '<silent>', '<F11>', ':<C-U>BuffergatorToggle<CR>')
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
call AddSeparator("File")
call AddNMapping("File", "vimgrep...", "vimgrep into and switch to current window's location list (normal mode)", '', '<C-_>', ':Lv /')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
