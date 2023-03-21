"
" [Mappings] File menu mappings
"

call AddMenu("File", 100)
call AddIMapping("File", "Complete...", 'Complete...', '', '<S-Tab>', '', 1)
call AddMapping("File", "Next buffer", "Go to next buffer in buffer list", '<silent>', '<Ctrl><Shift><Tab>', ':<C-U>bn<CR>')
call AddIMapping("File", "Exit insert mode", 'Exit insert mode', '', '<C-Q>', '<Esc>')
if has('nvim')
call AddTMapping("File", "Exit terminal mode", 'Exit terminal mode', '', '<Esc>', '<C-\><C-n>')
endif
call AddSeparator("File")
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<F9>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Telescope live_grep...", "Telescope live_grep...", '<silent>', '<F10>', ':lua require("telescope").extensions.menufacture.live_grep()<CR>')
call AddMapping("File", "Telescope grep_string...", "Telescope grep_string...", '<silent>', '<S-F10>', ':lua require("telescope").extensions.menufacture.grep_string()<CR>')
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
call AddMapping("File", "Toggle sidebar", "Toggle sidebar", '<silent>', '<Ctrl><F12>', ':lua require("sidebar-nvim").toggle({focus=true})<CR>')
call AddMapping("File", "Telescope files...", "Telescope files...", '<silent>', '<S-F12>', ':lua require("telescope").extensions.menufacture.find_files()<CR>')
call AddMapping("File", "Telescope buffers...", "Telescope buffers...", '<silent>', '<Alt><F12>', ':lua require("telescope.builtin").buffers()<CR>')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
