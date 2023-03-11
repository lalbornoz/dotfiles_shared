"
" [Mappings] File menu mappings
"

call AddMenu("File")
call AddNMapping("File", "Go to previous word", 'Go to previous word', '', '<Ctrl><Left>', 'b')
call AddNMapping("File", "Go to previous WORD", 'Go to previous WORD', '', '<Ctrl><Shift><Left>', 'B')
call AddNMapping("File", "Go to next word", 'Go to next word', '', '<Ctrl><Right>', 'w')
call AddNMapping("File", "Go to next WORD", 'Go to next WORD', '', '<Ctrl><Shift><Right>', 'W')
call AddNMapping("File", "Go to previous paragraph", 'Go to previous paragraph', '', '<Ctrl><Up>', '{')
call AddNMapping("File", "Go to previous section", 'Go to previous section', '', '<Ctrl><Shift><Up>', '[[')
call AddNMapping("File", "Go to next paragraph", 'Go to next paragraph', '', '<Ctrl><Down>', '}')
call AddNMapping("File", "Go to next section", 'Go to next section', '', '<Ctrl><Shift><Down>', ']]')
call AddNMapping("File", "Go to previous cursor position", 'Go to previous cursor position in jump list', '', '<Shift><Left>', '<C-O>')
call AddNMapping("File", "Go to next cursor position", 'Go to next cursor position in jump list', '', '<Shift><Right>', '<C-I>')
call AddNMapping("File", "Go to previous occurence", 'Go to previous occurence of the word nearest to the cursor', '', '<Shift><Up>', '#')
call AddNMapping("File", "Go to next occurence", 'Go to next occurence of the word nearest to the cursor', '', '<Shift><Down>', '*')
call AddSeparator("File")
call AddMapping("File", "Display manual page...", 'Display manual page...', '', '<F9>', ':<C-U>Man ')
call AddMapping("File", "Display manual page", "Display manual page from current word", '<silent>', '<S-F9>', '"zyiw:exe "Man ".@z.""<CR>')
call AddMapping("File", "Grep...", 'Grep...', '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Bgrep...", 'Grep in current buffer...', '', '<S-F10>', ':<C-U>Bgrep ')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<F11>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
call AddMapping("File", "Toggle Buffergator", "Toggle Buffergator window", '<silent>', '<S-F12>', ':<C-U>BuffergatorToggle<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
