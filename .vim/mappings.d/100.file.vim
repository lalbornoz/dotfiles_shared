"
" [Mappings] File menu mappings
"

call AddMenu("File", 100)
call AddIMapping("File", "Complete...", 'Complete...', '', '<S-Tab>', '', 1)
call AddIMapping("File", "Exit insert mode", 'Exit insert mode', '', '<C-Q>', '<Esc>')
if has('nvim')
call AddTMapping("File", "Exit terminal mode", 'Exit terminal mode', '', '<Esc>', '<C-\><C-n>')
endif
call AddSeparator("File")
call AddMapping("File", "Display manual page...", 'Display manual page...', '', '<F9>', ':<C-U>Man ')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<Alt><F9>', ':<C-U>CReadNewScratch ')
call AddMapping("File", "Display manual page", "Display manual page from current word", '<silent>', '<S-F9>', '"zyiw:exe "Man ".@z.""<CR>')
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Telescope live_grep...", "Telescope live_grep...", '<silent>', '<F10>', '<CMD>Telescope live_grep<CR>')
else
call AddMapping("File", "Grep...", 'Grep...', '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Rrep...", 'Recursive Grep...', '', '<Alt><F10>', ':<C-U>Rgrep ')
call AddMapping("File", "Bgrep...", 'Grep in current buffer...', '', '<S-F10>', ':<C-U>Bgrep ')
endif
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Open terminal...", "Open a new terminal window", '<silent>', '<F11>', ':<C-U>split term://$SHELL<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<Alt><F11>', ':<C-U>tabnew term://$SHELL<CR>')
else
call AddMapping("File", "Open terminal...", "Open a new terminal window", '<silent>', '<F11>', ':<C-U>terminal<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<Alt><F11>', ':<C-U>tab terminal<CR>')
endif
call AddSeparator("File")
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
if has('nvim')
call AddMapping("File", "Telescope buffers...", "Telescope buffers...", '<silent>', '<S-F12>', '<CMD>Telescope buffers<CR>')
call AddMapping("File", "Telescope files...", "Telescope files...", '<silent>', '<Alt><F12>', '<CMD>Telescope find_files<CR>')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
