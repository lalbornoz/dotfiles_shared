"
" [Mappings] File menu mappings
"

call AddMenu("File", 100)
call AddMapping("File", "Display manual page...", 'Display manual page...', '', '<F9>', ':<C-U>Man ')
call AddMapping("File", "Display manual page", "Display manual page from current word", '<silent>', '<S-F9>', '"zyiw:exe "Man ".@z.""<CR>')
call AddMapping("File", "Grep...", 'Grep...', '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Bgrep...", 'Grep in current buffer...', '', '<S-F10>', ':<C-U>Bgrep ')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<F11>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
call AddMapping("File", "Toggle Buffergator", "Toggle Buffergator window", '<silent>', '<S-F12>', ':<C-U>BuffergatorToggle<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
