"
" [Mappings] File menu mappings
"

call AddMenu("File")
call AddNMapping("File", "Go to previous word", 'Go to previous word', '', '<Ctrl><Left>', 'B')
call AddNMapping("File", "Go to next word", 'Go to next word', '', '<Ctrl><Right>', 'W')
call AddNMapping("File", "Go to previous section", 'Go to previous section', '', '<Ctrl><Up>', '[[')
call AddNMapping("File", "Go to next section", 'Go to next section', '', '<Ctrl><Down>', ']]')
call AddNMapping("File", "Go to previous cursor position", 'Go to previous cursor position in jump list', '', '<Shift><Left>', '<C-O>')
call AddNMapping("File", "Go to next cursor position", 'Go to next cursor position in jump list', '', '<Shift><Right>', '<C-I>')
call AddNMapping("File", "Go to previous occurence", 'Go to previous occurence of the word nearest to the cursor', '', '<Shift><Up>', '#')
call AddNMapping("File", "Go to next occurence", 'Go to next occurence of the word nearest to the cursor', '', '<Shift><Down>', '*')
call AddSeparator("File")
call AddMapping("File", "Display manual page...", 'Display manual page...', '', '<F9>', ':<C-U>Man ')
call AddMapping("File", "Display manual page", "Display manual page from current word", '<silent>', '<S-F9>', '"zyiw:exe "Man ".@z.""<CR>')
call AddMapping("File", "Grep...", 'Grep...', '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<S-F10>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
call AddMapping("File", "Toggle Buffergator", "Toggle Buffergator window", '<silent>', '<F11>', ':<C-U>BuffergatorToggle<CR>')
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
call AddSeparator("File")
call AddNMapping("File", "vimgrep...", "vimgrep into and switch to current window's location list (normal mode)", '', '<C-_>', ':Lv /')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
